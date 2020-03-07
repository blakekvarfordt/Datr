//
//  Person.swift
//  Datr
//
//  Created by Blake kvarfordt on 2/27/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import Foundation
import Firebase
import Messages

struct Person {
    // Basic Necessary Stuff
    var firstName: String
    var username: String
    var location: String
    var isNewUser: Bool = true
    var connections: [String]
    var matches: [String]
    var story: String
    
    // Unique identifier that tells the database who this person is.
    var uuid: String
    
    // Physical Appearance Filters
    var gender: String
    var sexualOrientation: String
    var preferredGender: String
    var age: Int
    
}
