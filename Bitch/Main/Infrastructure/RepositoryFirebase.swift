//
//  RepositoryFirebase.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import FirebaseDatabase

class RepositoryFirebase {
    private let userId: String
    private let database: DatabaseReference
    
    init(userId: String) {
        self.userId = userId
        self.database = Database.database().reference()
    }
}

extension RepositoryFirebase: Repository {
    func getMessages(success: @escaping (Array<String>) -> Void, failure: @escaping (Error) -> Void) {
        let path = "users/\(userId)/messages/"
        database.child(path).observeSingleEvent(of: .value, with: { (snapshot) in
            let messageDictionary = snapshot.value as? NSDictionary
            success(messageDictionary?.allValues as! Array<String>)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func sendMessage(message: String, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        let path = "users/\(userId)/messages/"
        database.child(path).childByAutoId().setValue(message)
    }
}
