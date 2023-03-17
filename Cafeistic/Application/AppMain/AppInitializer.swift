//
//  AppSetup.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 21.04.2021.
//

import UIKit
import Foundation
import LiteNet

class AppInitializer {
    public static let shared: AppInitializer = .init()
    public static var serloc: ServiceLocator!
    
//    private lazy var appNavigationController: UINavigationController = {
//        let navigationController = UINavigationController()
//        navigationController.isNavigationBarHidden = true
//        return navigationController
//    }()
    
//    private lazy var router: Router = .init(navigationScene: appNavigationController)
//    private lazy var appCoordinator: AppCoordinator = .init(router: router)
    
    private lazy var appCoordinator: AppCoordinator = .init()
    
    private var networkService: LiteNetProtocol {
        var isDebug = false
        
        #if DEBUG
        isDebug = true
        #endif
        
        let constants: LiteNetConstants = .init(
            isDebug: isDebug,
            debugUrl: ApiConstants.debugUrl,
            releaseUrl: ApiConstants.releaseUrl
        )
        let provider = LiteNetBaseProvider<AnyTarget>()
        
        return LiteNet(provider, constants: constants)
    }
    
    private var sessionTracker: SessionTracker {
        let storage = UserDefaultsStorage()
        return SessionTracker(storage: storage, networkService: networkService)
    }

    func setupAppCoordinator() {
//        window.rootViewController = appCoordinator.toPresentable()
//        window.rootViewController = SignInScene.initiate()
//        window.makeKeyAndVisible()
        appCoordinator.run()
    }
        
    func setupSerivces() {
        let registry = LazyServiceLocator()
        AppInitializer.serloc = registry
        
        registry.addService { self.networkService as LiteNetProtocol }
        registry.addService { self.sessionTracker as SessionTracker }
    }
}

