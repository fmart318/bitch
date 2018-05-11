//
//  ComposeController.swift
//  Bitch
//
//  Created by Felipe Martinez on 5/11/18.
//  Copyright © 2018 Felipe Martinez. All rights reserved.
//

import UIKit

class ComposeController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    private let viewModel: ComposeViewModel

    init(viewModel: ComposeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ComposeController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
}

extension ComposeController {
    @IBAction func deleteButtonTapped(_ sender: Any) {
        viewModel.deleteButtonTapped()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
    }
}

extension ComposeController: ComposeView {
    
}
