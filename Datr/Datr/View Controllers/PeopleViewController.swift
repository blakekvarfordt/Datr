//
//  PeopleViewController.swift
//  Datr
//
//  Created by Blake kvarfordt on 3/2/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var cardTextView: UITextView!
    @IBOutlet weak var resultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cardAction(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if xFromCenter > 0 {
            resultImageView.image = "🔥".image()
        } else {
            resultImageView.image = "💦".image()
//            resultLabel.text = "💦"
        }
        
        resultImageView.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                })
                return
            } else if card.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                })
                return
            }
            
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.view.center
                self.resultImageView.alpha = 0
            })
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
}
