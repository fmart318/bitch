//
//  DashboardView.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/10/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import FBSDKLoginKit

protocol DashboardView {
    func showProfile(_ profile: FBSDKProfile)
    func removeProfile()
}
