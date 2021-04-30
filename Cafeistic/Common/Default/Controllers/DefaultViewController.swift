//
//  DefaultViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//

import UIKit

class DefaultViewController: UIViewController {
    
    var handleTopAlertButtonTap: (() -> Void)?
    var handleBottomAlertButtonTap: (() -> Void)?

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

extension DefaultViewController: DefaultAlertViewControllerActionsHandle {
    func tappedTopButton() {
        handleTopAlertButtonTap?()
    }
    
    func tappedBottomButton() {
        handleBottomAlertButtonTap?()
    }
}

extension DefaultViewController {
    
    func showDefaultAlert(message: String, topButtonTitle: String, bottomButtonTitle: String) {
        let alertViewController = DefaultAlertViewController()
        alertViewController.message = message
        alertViewController.topButtonTitle = topButtonTitle
        alertViewController.bottomButtonTitile = bottomButtonTitle
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        alertViewController.delegate = self
        present(alertViewController, animated: true)
        
    }
    
    func showDefaultAlert(title: String, message: String, buttonTitle: String) {
        
    }
}
