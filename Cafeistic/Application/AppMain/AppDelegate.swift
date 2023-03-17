//
//  AppDelegate.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 01.02.2021.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        setupAppInitializer()
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }

    private func setupAppInitializer() {
        AppInitializer.shared.setupSerivces()
        AppInitializer.shared.setupAppCoordinator()
    }
}

