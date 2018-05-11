//
//  ComposeViewModelDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

class ComposeViewModelDefault {
    var view: ComposeView?
    let coordinator: AppCoordinator
    let sendMessageAction: SendMessageAction
    
    init(coordinator: AppCoordinator, sendMessageAction: SendMessageAction) {
        self.coordinator = coordinator
        self.sendMessageAction = sendMessageAction
    }
}

extension ComposeViewModelDefault: ComposeViewModel {
    func viewDidLoad() {
        
    }
    
    func cancelButtonTapped() {
        self.coordinator.closeCompose()
    }
    
    func sendButtonTapped(message: String) {
        sendMessageAction.execute(message: message, success: {
            
        }) { (Error) in
            
        }
    }
}
