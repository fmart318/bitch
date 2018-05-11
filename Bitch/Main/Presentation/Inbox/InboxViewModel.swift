//
//  InboxViewModel.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

protocol InboxViewModel {
    var messages: Array<String> { get }
    func viewDidLoad()
    func composeButtonTapped()
}
