//
//  FirebaseManager.swift
//  Datr
//
//  Created by Blake kvarfordt on 2/26/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import FirebaseFirestore

struct FirebaseKeys {
    static let firstName = "firstName"
    static let lastName = "lastName"
    static let bio = "bio"
    static let username = "username"
    static let gender = "gender"
    static let age = "age"
    static let location = "location"
    static let images = "images"
}

class FirebaseManager {
    
    static let databaseReference = Firestore.firestore().collection("users")
    
    static func addPersonToFirebase(_ person: Person, completion: @escaping (Result<Person, Error>) -> Void) {
        let personData: [String : Any] = [
            FirebaseKeys.firstName : person.firstName,
            FirebaseKeys.lastName : person.lastName,
            FirebaseKeys.bio : person.bio,
            FirebaseKeys.username : person.username,
            FirebaseKeys.gender : person.gender,
            FirebaseKeys.age : person.age,
            FirebaseKeys.location : person.location,
            FirebaseKeys.images : person.images
        ]
        databaseReference.document(person.username).setData(personData) { (error) in
            if let error = error {
                // present error or something to the user
                print("error \(error)")
                completion(.failure(error))
            } else {
                completion(.success(person))
            }
        }
    }
    
    static func checkForUniqueUsername(_ username: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        databaseReference.whereField(FirebaseKeys.username, isEqualTo: username).getDocuments { (snapshot, error) in
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
}

