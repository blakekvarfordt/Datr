//
//  Person.swift
//  Datr
//
//  Created by Blake kvarfordt on 2/27/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import Foundation
import Firebase

struct Person {
    // Name
    var firstName: String
    
    // Physical Appearance
    var gender: String
    var hairColor: String
    var eyeColor: String
    var skinColor: String
    var height: Int
    var hairLength: Int
    var age: Int
    
    // About
    var username: String
    
    // One word to describe yourself
    var oneWordDescription: String
    
    // Things that annoy you.
    var petPeeves: String
    
    // Describe a meaningful childhood memory you have. Why this memory?
    var childhoodMemory: String
    
    // Describe the best peice of advice someone has given you. Why do you like it?
    var bestAdviceReceived: String
    
    // Are you a leader or a follower. Why?
    var leaderOrFollower: String
    
    // When you have a bad day, what do you do to cheer yourself up?
    var badDayRecovery: String
    
    // What's your dream job. Why this job?
    var dreamJob: String
    
    // What talents do you have?
    var talents: String
    
    // What's your relationship with your family like?
    var familyRelationship: String
    
    // What is the worst thing you did as a kid?
    var worstThingGrowingUp: String
    
    // What are you like when you're angry. Describe an experience.
    var angerDescription: String
    
    var bio: String
    var location: String
    var uuid: String
}
