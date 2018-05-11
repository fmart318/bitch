//
//  getMessages.swift
//  Bitch
//
//  Created by Felipe Martinez on 11/05/2018.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

class GetMessagesActionDefault: BaseAction, GetMessagesAction {
    func execute(success: @escaping (Array<String>) -> Void, failure: @escaping (Error) -> Void) {
        repository.getMessages(success: success, failure: failure)
    }
}
