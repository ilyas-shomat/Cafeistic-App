//
//  AppSetup.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 21.04.2021.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class AppSetup {
    
    public static let shared = AppSetup()

    func setupRootScene(window: UIWindow) {
        window.rootViewController = DefaultNavigationController()
        guard let rootNavgiationController = window.rootViewController as? UINavigationController else {
            fatalError("Root viewController must be inherited from UINavigationController")
        }
        rootNavgiationController.pushViewController(EstablishmentSignUpScene.initiate(), animated: false)
        window.makeKeyAndVisible()
    }
    
    func setupSerivces() {
        IQKeyboardManager.shared.enable = true
    }
}
