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
        setupButtons()
    }
    
    private func setupButtons() {
        loginButton.readPermissions =  ["public_profile", "email", "user_friends"]
    }
}

extension DashboardController {
    @IBAction func inboxButtonTapped(_ sender: Any) {
//        viewModel.inboxButtonTapped()
        let viewModel = InboxViewModelDefault()
        let controller = InboxController(viewModel: viewModel)
        viewModel.view = controller
        
//        pushViewController(controller, animated: true)
    }
}

extension DashboardController: DashboardView {
    func showProfile(_ profile: FBSDKProfile) {
        facebookName.text = profile.firstName + " " + profile.lastName
        inboxButton.isHidden = false
        facebookPicture.isHidden = false
        facebookPicture.profileID = FBSDKAccessToken.current().userID
    }
    
    func removeProfile() {
        facebookName.text = ""
        facebookPicture.isHidden = true
        inboxButton.isHidden = true
        facebookPicture.profileID = ""
    }
}

