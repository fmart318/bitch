//
//  InboxViewModelDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

class InboxViewModelDefault {
    var view: InboxView?
    var getMessagesAction: GetMessagesAction
    let coordinator: AppCoordinator
    var messages = Array<String>()
    
    init(coordinator: AppCoordinator, getMessagesAction: GetMessagesAction) {
        self.coordinator = coordinator
        self.getMessagesAction = getMessagesAction
    }
}

extension InboxViewModelDefault: InboxViewModel {
    func viewWillAppear() {
        view?.showLoading()
        getMessagesAction.execute(success: { (messages) in
            self.messages = messages
            self.view?.reloadTable()
        }) { (Error) in
            self.view?.hideLoading()
        }
    }
    
    func composeButtonTapped() {
        coordinator.goToCompose()
    }
}
