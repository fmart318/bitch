//
//  Repository.swift
//  Bitch
//
//  Created by Felipe Martinez on 11/05/2018.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

protocol Repository {
    func sendMessage(message: String, success: @escaping () -> Void, failure: @escaping (Error) -> Void)
    func getMessages(success: @escaping (Array<String>) -> Void, failure: @escaping (Error) -> Void)
}
