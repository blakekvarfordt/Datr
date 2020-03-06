//
//  PeopleViewController.swift
//  Datr
//
//  Created by Blake kvarfordt on 3/2/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var cardBackgroundView: UIView!
    @IBOutlet weak var cardTextView: UITextView!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    /// Helps set the rotation angle of the card
    var angleDivisor: CGFloat!
    
    /// index of the card being displayed to the user.
    var index: Int = 0
    
    /// person object on the card
    var person: Person? {
        didSet {
            index += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        angleDivisor = (view.frame.width / 2) / 0.5
        setupCard()
    }
    
    @IBAction func cardAction(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        // Track the center of the card
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        // Decrease the size of the card as it is dragged further away from the center
        let scale = min(70 / abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / angleDivisor).scaledBy(x: scale, y: scale)
        
        // Set the image on right or left of the center
        if xFromCenter > 0 {
            resultImageView.image = "😏".image()
        } else {
            resultImageView.image = "😒".image()
        }
        
        resultImageView.alpha = abs(xFromCenter) / (view.center.x * 0.2)
        
        // What to do when the gesture ends
        if sender.state == UIGestureRecognizer.State.ended {
            
            // Card disappears on either side if the card's center is within 75 from the edges
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                    self.setupCard()
                })
                return
            } else if card.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                    self.setupCard()
                })
                return
            }
            
            // Springs back to the center
            UIView.animate(withDuration: 0.4, animations: {
                card.center = self.view.center
                self.resultImageView.alpha = 0
                self.cardTextView.alpha = 1
                card.transform = .identity
            })
        }
    }
    
    
    // MARK: - Helper Methods
    
    func setupCard() {
        person = MockPeople.mockPeople[index]
        
        if person != nil {
            cardBackgroundView.center.x = view.center.x
            cardBackgroundView.center.y = view.center.y
            cardBackgroundView.alpha = 1
            cardBackgroundView.transform = .identity
            
            resultImageView.alpha = 0
            
            nameLabel.text = "\(person?.firstName) - \(person?.age)"
            cardTextView.text = person?.story
        }
        
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
}
