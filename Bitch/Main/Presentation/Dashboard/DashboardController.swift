//
//  DashboardController.swift
//  Bitch
//
//  Created by Felipe Martinez on 10/13/17.
//  Copyright © 2017 Felipe Martinez. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class DashboardController: UIViewController {
    
    @IBOutlet weak var facebookName: UILabel!
    @IBOutlet weak var facebookPicture: FBSDKProfilePictureView!
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    @IBOutlet weak var inboxButton: UIButton!
    
    private let viewModel: DashboardViewModel
    
    private struct Localizations {
        static let title = "Dashboard"
        static let defaultFacebookName = "Guest"
    }

    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DashboardController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupHeader()
        setupButtons()
    }
    
    private func setupHeader() {
        title = Localizations.title
    }
    
    private func setupButtons() {
        loginButton.readPermissions =  ["public_profile", "email", "user_friends"]
    }
}

extension DashboardController {
    @IBAction func inboxButtonTapped(_ sender: Any) {
        viewModel.inboxButtonTapped()
    }
}

extension DashboardController: DashboardView {
    func showProfile(_ profile: FBSDKProfile) {
        facebookName.text = profile.firstName + " " + profile.lastName
        facebookPicture.profileID = FBSDKAccessToken.current().userID
    }
    
    func removeProfile() {
        facebookName.text = Localizations.defaultFacebookName
        facebookPicture.profileID = ""
    }
}

