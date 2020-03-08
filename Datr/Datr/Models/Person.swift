//
//  Person.swift
//  Datr
//
//  Created by Blake kvarfordt on 2/27/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import Foundation
import Firebase
import MessageKit

struct PersonKeys {
    static let senderID = "senderID"
    static let firebaseID = "firebaseID"
    static let displayName = "displayName"
    static let firstName = "firstName"
    static let location = "location"
    static let isNewUser = "isNewUser"
    static let connections = "connections"
    static let story = "story"
    static let gender = "gender"
    static let sexualOrientation = "sexualOrientation"
    static let preferredGender = "preferredGender"
    static let age = "age"
}

struct Person: SenderType {
    var senderId: String
    var firebaseID: String
    var displayName: String
    var firstName: String
    var location: String
    var isNewUser: Bool
    var connections: [String]
    var story: String
    var gender: String
    var sexualOrientation: String
    var preferredGender: String
    var age: Int
    
    var jsonData: [String : Any] {
        return [
            PersonKeys.senderID : self.senderId,
            PersonKeys.firebaseID : self.firebaseID,
            PersonKeys.displayName : self.displayName,
            PersonKeys.firstName : self.firstName,
            PersonKeys.location : self.location,
            PersonKeys.isNewUser : self.isNewUser,
            PersonKeys.connections : self.connections,
            PersonKeys.story : self.story,
            PersonKeys.gender : self.gender,
            PersonKeys.sexualOrientation : self.sexualOrientation,
            PersonKeys.preferredGender : self.preferredGender,
            PersonKeys.age : self.age
        ]
    }
    
    init(firebaseID: String, firstName: String, location: String, connections: [String], story: String, gender: String, sexualOrientation: String, preferredGender: String, age: Int, isNewUser: Bool = true) {
        self.senderId = firebaseID
        self.firebaseID = firebaseID
        self.displayName = firstName
        self.firstName = firstName
        self.location = location
        self.connections = connections
        self.story = story
        self.gender = gender
        self.sexualOrientation = sexualOrientation
        self.preferredGender = preferredGender
        self.age = age
        self.isNewUser = isNewUser
    }
    
    init?(dictionary: [String : Any]) {
        guard let firstName = dictionary[PersonKeys.firstName] as? String,
            let firebaseID = dictionary[PersonKeys.firebaseID] as? String,
            let location = dictionary[PersonKeys.location] as? String,
            let connections = dictionary[PersonKeys.connections] as? [String],
            let story = dictionary[PersonKeys.story] as? String,
            let gender = dictionary[PersonKeys.gender] as? String,
            let sexualOrientation = dictionary[PersonKeys.sexualOrientation] as? String,
            let preferredGender = dictionary[PersonKeys.preferredGender] as? String,
            let age = dictionary[PersonKeys.age] as? Int,
            let isNewUser = dictionary[PersonKeys.isNewUser] as? Bool
            else { return nil }
        
        self.firstName = firstName
        self.displayName = firstName
        self.firebaseID = firebaseID
        self.senderId = firebaseID
        self.location = location
        self.connections = connections
        self.story = story
        self.gender = gender
        self.sexualOrientation = sexualOrientation
        self.preferredGender = preferredGender
        self.age = age
        self.isNewUser = isNewUser
    }
}
