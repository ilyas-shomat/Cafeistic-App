//
//  UIViewController+Alert.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.04.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showDefaultAlert(message: String, topButtonTitle: String, bottomButtonTitle: String) {
        let alertViewController = DefaultAlertViewController()
        alertViewController.message = message
        alertViewController.topButtonTitle = topButtonTitle
        alertViewController.bottomButtonTitile = bottomButtonTitle
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        present(alertViewController, animated: true)
        
    }
    
    func showDefaultAlert(title: String, message: String, buttonTitle: String) {
        
    }
}
