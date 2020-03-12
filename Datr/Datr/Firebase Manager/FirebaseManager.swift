//
//  FirebaseManager.swift
//  Datr
//
//  Created by Blake kvarfordt on 2/26/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import FirebaseFirestore
import FirebaseAuth

struct FirebaseKeys {
    static let users = "users"
    static let dates = "dates"
    static let matches = "matches"
    static let chats = "chats"
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
        
//        databaseReference.collection(FirebaseKeys.users).document(person.username).setData(personData) { (error) in
//            if let error = error {
//                // present error or something to the user
//                print("error \(error)")
//                completion(.failure(error))
//            } else {
//                completion(.success(person))
//            }
//        }
    }
    
     /// Checks for a user in the database that has already taken a desired username from a new user. If a user document comes back that means that the username is taken and then display an alert to the user saying to try a different username.
    ///
    /// - Parameter username: The new username the user wants to claim.
    ///
    /// - Parameter completion: Completes with an error if there was a problem with the system. Completes true  if a user document does NOT comes back. Completes false if a user document does come back.
    static func checkForUniqueUsername(_ username: String, completion: @escaping (Result<Bool, Error>) -> Void) {
//        databaseReference.collection(FirebaseKeys.users).whereField(FirebaseKeys.username, isEqualTo: username).getDocuments { (snapshot, error) in
//            if let error = error {
//                // present error or something to the user
//                print("error \(error)")
//                completion(.failure(error))
//            } else if snapshot?.documents != nil {
//                completion(.success(false))
//            } else if snapshot?.documents == nil {
//                completion(.success(true))
//            }
//        }
    }
    
    static func fetchChats() {
        //Fetch all the chats which has current user in it
        databaseReference.collection(FirebaseKeys.chats).whereField(FirebaseKeys.users, arrayContains: Auth.auth().currentUser?.uid ?? "Not Found User 1").getDocuments { (chatQuerySnap, error) in
            if let error = error {
                print("Error: \(error)")
                return
            } else {
                //Count the no. of documents returned
                guard let queryCount = chatQuerySnap?.documents.count else {
                    return
                }
            }
        }
    }
    
    static func createNewChat(_ currentUser: String, otherUser: String) {
        let users = [currentUser, otherUser]
        let data: [String: Any] = [
            "users":users
        ]
        let db = Firestore.firestore().collection("Chats")
        db.addDocument(data: data) { (error) in
            if let error = error {
                print("Unable to create chat! \(error)")
                return
            } else {
                
            }
        }
    }
    
    private func saveMessage(_ message: Message, _ chatReference: DocumentReference) {
        //Writing it to the thread using the saved document reference we saved in load chat function
        chatReference.collection("thread").addDocument(data: message.dictionary, completion: { (error) in
            if let error = error {
                print("Error Sending message: \(error)")
                return
            }
        })
    }
}

