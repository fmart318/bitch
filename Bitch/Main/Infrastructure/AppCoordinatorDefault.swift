//
//  AppCoordinatorDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import UIKit
import FirebaseAuth

class AppCoordinatorDefault {
    private let guestId = "guest_id"
    private var currentUserId: String {
        guard let user = Auth.auth().currentUser?.uid else { return guestId }
        return user
    }
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension AppCoordinatorDefault: AppCoordinator {
    func goToInbox() {
        let repository = RepositoryFirebase(userId:currentUserId)
        let viewModel = InboxViewModelDefault(coordinator: self, getMessagesAction: GetMessagesActionDefault(repository: repository))
        let controller = InboxController(viewModel: viewModel)
        viewModel.view = controller
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToCompose() {
        let repository = RepositoryFirebase(userId:currentUserId)
        let viewModel = ComposeViewModelDefault(coordinator: self, sendMessageAction: SendMessageActionDefault(repository:repository))
        let controller = ComposeController(viewModel: viewModel)
        viewModel.view = controller
        navigationController.present(controller, animated: true, completion: nil)
    }
    
    func closeCompose() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
