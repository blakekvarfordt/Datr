//
//  PersonController.swift
//  Datr
//
//  Created by Blake kvarfordt on 2/27/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import Foundation

class PersonController {
    
    static let shared = PersonController()
    
    var currentUser: Person?
    var people = [Person]()
    
    func createPerson(_ person: Person, completion: @escaping (Bool) -> Void) {
        FirebaseManager.addPersonToFirebase(person) { (result) in
            switch result {
            case .failure(let e):
                // show something to the user
                print(e.localizedDescription)
                completion(false)
            case .success(let person):
                self.currentUser = person
                completion(true)
            }
        }
    }
    
    func checkForUniqueUsername(_ username: String, completion: @escaping (Bool) -> Void) {
        FirebaseManager.checkForUniqueUsername(username) { (result) in
            switch result {
            case .success(true):
                print("successsssssss")
                completion(true)
            case .success(false):
                print("Not success")
                completion(false)
            case .failure(let e):
                print(e.localizedDescription)
                completion(false)
            }
        }
    }
}
