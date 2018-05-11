//
//  InboxViewModelDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

class InboxViewModelDefault {
    var view: InboxView?
    var getMessagesAction: GetMessagesAction?
    let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator, getMessagesAction: GetMessagesAction) {
        self.coordinator = coordinator
        self.getMessagesAction = getMessagesAction
    }
}

extension InboxViewModelDefault: InboxViewModel {
    func composeButtonTapped() {
        coordinator.goToCompose()
    }
    
    var messages: Array<String> { return ["message1", "message2", "message3"] }
    
    func viewDidLoad() {
        
    }
}
