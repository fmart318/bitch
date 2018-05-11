//
//  DashboardCoordinatorDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import UIKit

class DashboardCoordinatorDefault {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension DashboardCoordinatorDefault: DashboardCoordinator {
    func goToInbox() {
        let viewModel = InboxViewModelDefault()
        let controller = InboxController(viewModel: viewModel)
        viewModel.view = controller
        navigationController.pushViewController(controller, animated: true)
    }
}
