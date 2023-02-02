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
    func showDefaultAlert(
        message: String,
        topButtonTitle: String,
        bottomButtonTitle: String
    ) {
        let alertViewController = DefaultAlertViewController()
        alertViewController.message = message
        alertViewController.topButtonTitle = topButtonTitle
        alertViewController.bottomButtonTitile = bottomButtonTitle
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        alertViewController.delegate = self
        present(alertViewController, animated: true)
    }
    
    //MARK: - Later need to change it to DefaultAlertViewController()
    func showDefaultAlert(
        title: String,
        message: String,
        buttonTitle: String
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension DefaultViewController: ErrorAlertProtocol {
    func showErrorAlert(message: AlertMessageConstant) {
        showDefaultAlert(
            title: message.title,
            message: message.message,
            buttonTitle: message.buttonTitle
        )
    }
}
