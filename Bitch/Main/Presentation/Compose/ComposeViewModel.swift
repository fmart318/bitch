//
//  ComposeViewModel.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

protocol ComposeViewModel {
    func viewDidLoad()
    func cancelButtonTapped()
    func sendButtonTapped(message: String)
}
