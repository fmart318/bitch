//
//  RepositoryFirebase.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

class RepositoryFirebase {
    private let userId: String
    private let networkClient: NetworkClient
    
    init(userId: String, networkClient: NetworkClient) {
        self.userId = userId
        self.networkClient = networkClient
    }
}

extension RepositoryFirebase: Repository {
    func sendMessage(message: String, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        let firebasePath = "users/\(userId)/messages/"
        networkClient.post(path: firebasePath, parameters: nil, success: { (json, response) in
            success()
        }, failure: failure)
    }
}
