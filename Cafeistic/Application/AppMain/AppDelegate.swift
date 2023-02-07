//
//  AppDelegate.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 01.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        setupRootScene()
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }

    private func setupRootScene() {
        guard let window = window else { return }
        AppInitializer.shared.setupSerivces()
        AppInitializer.shared.setupAppCoordinator(window: window)
    }
}

