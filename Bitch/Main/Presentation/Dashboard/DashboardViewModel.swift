//
//  DashboardViewModel.swift
//  Bitch
//
//  Created by Felipe Martinez on 10/13/17.
//  Copyright © 2017 Felipe Martinez. All rights reserved.
//

import FBSDKLoginKit

protocol DashboardViewModel: FBSDKLoginButtonDelegate {
    func viewDidLoad()
    func inboxButtonTapped()
}
