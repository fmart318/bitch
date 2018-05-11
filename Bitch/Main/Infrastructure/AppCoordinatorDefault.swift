//
//  AppCoordinatorDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import UIKit

class AppCoordinatorDefault {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension AppCoordinatorDefault: AppCoordinator {
    func goToInbox() {
        let viewModel = InboxViewModelDefault(coordinator: self, getMessagesAction: GetMessagesActionDefault())
        let controller = InboxController(viewModel: viewModel)
        viewModel.view = controller
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToCompose() {
        let repository = RepositoryFirebase(userId:"1" , networkClient: NetworkClientDefault())
        let viewModel = ComposeViewModelDefault(coordinator: self, sendMessageAction: SendMessageActionDefault(repository:repository))
        let controller = ComposeController(viewModel: viewModel)
        viewModel.view = controller
        navigationController.present(controller, animated: true, completion: nil)
    }
    
    func closeCompose() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
