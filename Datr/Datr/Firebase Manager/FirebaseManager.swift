//
//  FirebaseManager.swift
//  Datr
//
//  Created by Blake kvarfordt on 2/26/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import FirebaseFirestore

struct FirebaseKeys {
    // Person keys
    static let firstName = "firstName"
    static let lastName = "lastName"
    static let bio = "bio"
    static let username = "username"
    static let gender = "gender"
    static let age = "age"
    static let location = "location"
    static let images = "images"
    static let uuid = "uuid"
    
    // Date keys
    static let availability = "availability"
    static let activities = "activities"
    static let candidates = "candidates"
    
    // Collection keys
    static let users = "users"
    static let dates = "dates"
}

class FirebaseManager {
    
    /// References the Firestore database
    static let databaseReference = Firestore.firestore()
    
    
    // MARK: - Person Methods
    
    /// Creates a Person dictionary and sends it to the databse.
    ///
    /// - Parameter person: The users information packaged into a first class object called Person.
    ///
    /// - Parameter completion: Completes with an error if there was a problem with the system. Completes with the Person object if it was saved successfully to the database. The object be then be saved locally.
    static func addPersonToFirebase(_ person: Person, completion: @escaping (Result<Person, Error>) -> Void) {
        let personData: [String : Any] = [
            FirebaseKeys.firstName : person.firstName,
            FirebaseKeys.lastName : person.lastName,
            FirebaseKeys.bio : person.bio,
            FirebaseKeys.username : person.username,
            FirebaseKeys.gender : person.gender,
            FirebaseKeys.age : person.age,
            FirebaseKeys.location : person.location,
            FirebaseKeys.images : person.images,
            FirebaseKeys.uuid : person.uuid
        ]
        databaseReference.collection(FirebaseKeys.users).document(person.username).setData(personData) { (error) in
            if let error = error {
                // present error or something to the user
                print("error \(error)")
                completion(.failure(error))
            } else {
                completion(.success(person))
            }
        }
    }
    
     /// Checks for a user in the database that has already taken a desired username from a new user. If a user document comes back that means that the username is taken and then display an alert to the user saying to try a different username.
    ///
    /// - Parameter username: The new username the user wants to claim.
    ///
    /// - Parameter completion: Completes with an error if there was a problem with the system. Completes true  if a user document does NOT comes back. Completes false if a user document does come back.
    static func checkForUniqueUsername(_ username: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        databaseReference.collection(FirebaseKeys.users).whereField(FirebaseKeys.username, isEqualTo: username).getDocuments { (snapshot, error) in
            if let error = error {
                // present error or something to the user
                print("error \(error)")
                completion(.failure(error))
            } else if snapshot?.documents != nil {
                completion(.success(false))
            } else if snapshot?.documents == nil {
                completion(.success(true))
            }
        }
    }
    
    
    // MARK: - Date Methods
    
    /// Creates a Date dictionary and sends it to the databse.
    ///
    /// - Parameter date: The date information packaged into a first class object called Date.
    ///
    /// - Parameter completion: Completes with an error for system problems. Completes with the Date object if it was saved successfully to the database. The object will be then be saved locally.
    static func addDateToFirebase(_ date: Date, completion:  @escaping (Result<Date, Error>) -> Void) {
        let dateData: [String : Any] = [
            FirebaseKeys.availability : date.availability,
            FirebaseKeys.activities : date.activities,
            FirebaseKeys.candidates : date.candidates,
            FirebaseKeys.username : date.username
        ]
        
        databaseReference.collection(FirebaseKeys.dates).document(date.username).setData(dateData) { (error) in
            if let error = error {
                // present error or something to the user
                print("error \(error)")
                completion(.failure(error))
            } else {
                completion(.success(date))
            }
        }
    }
}

