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
    private var loadingView: LoadingView!
    
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
        tableView.delegate = self
        tableView.dataSource = self
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    func setup() {
        setupHeader()
        setupLoadingView()
    }
    
    func setupHeader() {
        title = Localizations.title
        let composeButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeButtonTapped))
        navigationItem.rightBarButtonItem = composeButton
    }
    
    func setupLoadingView() {
        loadingView = LoadingView(frame: view.bounds)
        loadingView.isHidden = true
        if let view = navigationController?.view {
            view.addSubview(loadingView)
            loadingView.snp.makeConstraints { (make) in
                make.edges.equalTo(view)
            }
        }
    }
}

extension InboxController {
    @objc func composeButtonTapped() {
        viewModel.composeButtonTapped()
    }
}

extension InboxController: InboxView {
    func showLoading() {
        loadingView.isHidden = false
    }
    
    func hideLoading() {
        loadingView.isHidden = true
    }
    
    func reloadTable() {
        hideLoading()
        tableView.reloadData()
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

