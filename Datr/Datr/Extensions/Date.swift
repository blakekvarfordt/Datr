//
//  Date.swift
//  Datr
//
//  Created by Blake kvarfordt on 3/8/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.string(from: self)
    }
    
    func toPrettyString() -> String {
        
        // Calulate time between now and the time it was sent
        let timerInterval = Date().timeIntervalSince(self)
        
        // Check to see if time interval is less then an hour
        if timerInterval < 60 * 60 {
            
            let minutes = Int(timerInterval / 60)
            
            let pluralText = minutes == 1 ? "min" : "mins"
            return "\(minutes) \(pluralText) ago"
        } else {
            let dateFormatter = DateFormatter()
            // Format date
            dateFormatter.dateFormat = "MMM d, h:mm a" // ex Nov, 27, 5:10 pm
            return dateFormatter.string(from: self)
        }
    }
}
