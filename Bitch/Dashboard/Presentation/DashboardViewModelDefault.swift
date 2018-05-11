//
//  DashboardViewModelDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/10/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class DashboardViewModelDefault {
    var view: DashboardView?
    var coordinator: DashboardCoordinator?
}

extension DashboardViewModelDefault: DashboardViewModel {
    func viewDidLoad() {
        setupNotifications()
        loadUser()
    }
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(loadUser), name: NSNotification.Name.FBSDKAccessTokenDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadUser), name: NSNotification.Name.FBSDKProfileDidChange, object: nil)
    }
    
    func inboxButtonTapped() {
        coordinator?.goToInbox()
    }
    
    @objc private func loadUser() {
        if let _ = FBSDKAccessToken.current() {
            FBSDKProfile.loadCurrentProfile { (profile, error) in
                if let _ = error {
                    self.view?.removeProfile()
                }
                else if let profile = profile {
                    self.view?.showProfile(profile)
                }
            }
        }
        else {
            self.view?.removeProfile()
        }
    }
}
