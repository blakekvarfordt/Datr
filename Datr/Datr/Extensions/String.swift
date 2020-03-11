//
//  String.swift
//  Datr
//
//  Created by Blake kvarfordt on 3/4/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import UIKit

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 45, height: 45)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension String {
    /// converts a string to date
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return dateFormatter.date(from: self)!
    }
    
    func getInitals() -> String {
        let splitStr = self.split(separator: " ")
        
        var initals = ""
        
        for str in splitStr {
            guard let char = str.first else {continue}
            initals.append(char)
            continue
        }
        
        return removeSpecialCharsFromString(text: initals)
    }
    
    private func removeSpecialCharsFromString(text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return String(text.filter {okayChars.contains($0) })
    }
}
