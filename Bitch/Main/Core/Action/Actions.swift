//
//  Actions.swift
//  Bitch
//
//  Created by Felipe Martinez on 11/05/2018.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

protocol GetMessagesAction {
    func execute(success: @escaping (Array<String>) -> Void, failure: @escaping (Error) -> Void)
}

protocol SendMessageAction {
    func execute(message: String, success: @escaping () -> Void, failure: @escaping (Error) -> Void)
}
