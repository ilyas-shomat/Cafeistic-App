//
//  AppSetup.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 21.04.2021.
//

import Foundation
import UIKit
import LiteNet

class AppInitializer {
    public static let shared: AppInitializer = .init()
    public static var serloc: ServiceLocator!
    
    private lazy var appNavigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
    
    private lazy var router: Router = .init(navigationScene: appNavigationController)
    private lazy var appCoordinator: AppCoordinator = .init(router: router)
    
    var networkService: LiteNetProtocol {
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
    
    var sessionTracker: SessionTracker {
        let storage = UserDefaultsStorage()
        return SessionTracker(storage: storage, networkService: networkService)
    }

    func setupAppCoordinator(window: UIWindow) {
        window.rootViewController = appCoordinator.toPresentable()
        window.makeKeyAndVisible()
    }
        
    func setupSerivces() {
        let registry = LazyServiceLocator()
        AppInitializer.serloc = registry
        
        registry.addService { self.networkService as LiteNetProtocol }
        registry.addService { self.sessionTracker as SessionTracker }
    }
}

