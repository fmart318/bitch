//
//  SendMessage.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

class SendMessageActionDefault: BaseAction, SendMessageAction {
    func execute(message: String, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        repository.sendMessage(message: message, success: success, failure: failure)
    }
}
