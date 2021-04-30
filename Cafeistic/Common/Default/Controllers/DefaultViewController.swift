//
//  DefaultViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//

import UIKit

class DefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupBaseUI() {
        view.backgroundColor = .appGray
    }
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(title: "", style:.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
}
