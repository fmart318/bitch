//
//  ComposeViewModelDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

class ComposeViewModelDefault {
    var view: ComposeView?
    var coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
}

extension ComposeViewModelDefault: ComposeViewModel {
    func viewDidLoad() {
        
    }
    
    func deleteButtonTapped() {
        self.coordinator.closeCompose()
    }
}
