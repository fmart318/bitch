//
//  InboxController.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import UIKit

class InboxController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel: InboxViewModel
    
    private struct Localizations {
        static let title = "Inbox"
    }
    
    init(viewModel: InboxViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "InboxController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setup()
    }
    
    func setup() {
        setupHeader()
    }
    
    func setupHeader() {
        title = Localizations.title
        let composeButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeButtonTapped))
        navigationItem.rightBarButtonItem = composeButton
    }
}

extension InboxController {
    @objc func composeButtonTapped() {
        viewModel.composeButtonTapped()
    }
}

extension InboxController: InboxView {
    func showMessages() {
        
    }
}

extension InboxController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell")
        if cell == nil {
            cell = UITableViewCell()
            cell?.textLabel?.text = viewModel.messages[indexPath.row]
        }
        return cell!
    }
}

