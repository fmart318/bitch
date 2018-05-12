//
//  DashboardViewModelDefault.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/10/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth

class DashboardViewModelDefault: NSObject {
    var view: DashboardView?
    var coordinator: AppCoordinator?
}

extension DashboardViewModelDefault: DashboardViewModel {
    func viewDidLoad() {
        loadUser()
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

extension DashboardViewModelDefault: FBSDKLoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let firebaseAuth = Auth.auth()
        do {
            loadUser()
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        loginToFirebase(credential: FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString))
    }
    
    private func loginToFirebase(credential: AuthCredential) {
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.loadUser()
        }
    }
}
