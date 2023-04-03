//
//  CustomerMainCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.03.2023.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    private lazy var tempFirstCoordinator: FirstCoordinator = {
        let coordinator = FirstCoordinator(
            coordinatingType: .currentFlow()
        )
        
        coordinator.setRouterWithRootScene()
        coordinator.toPresentable?.tabBarItem = .init(
            title: "0 Scene",
            image: nil,
            tag: 0
        )
                
        addChild(coordinator)
        return coordinator
    }()
    
    private lazy var tempSecondCoordinator: SecondCoordinator = {
        let coordinator = SecondCoordinator(
            coordinatingType: .currentFlow()
        )

        coordinator.setRouterWithRootScene()
        coordinator.toPresentable?.tabBarItem = .init(
            title: "1 Scene",
            image: nil,
            tag: 0
        )
        
        addChild(coordinator)
        return coordinator
    }()
    
    private lazy var tempThirdCoordinator: ThirdCoordinator = {
        let coordinator = ThirdCoordinator(
            coordinatingType: .currentFlow()
        )
        
        coordinator.setRouterWithRootScene()
        coordinator.toPresentable?.tabBarItem = .init(
            title: "2 Scene",
            image: nil,
            tag: 0
        )
        
        addChild(coordinator)
        return coordinator
    }()
    
    private let tabBarScene: UITabBarController = .init()
    private var tabs: [UIViewController: Coordinator] = .init()
    
    override var root: Presentable {
        return tabBarScene
    }

    var flowCompletion: CompletionHandler?

    init(
        router: Router = .init(navigationScene: nil)
    ) {
        super.init(router: router)
        setupTabbarScene()
    }
    
    private func setupTabbarScene() {
        tabBarScene.tabBar.tintColor = .red
        tabBarScene.tabBar.unselectedItemTintColor = .black
        tabBarScene.tabBar.backgroundColor = .appGray
        
        var scenes: [UIViewController] = [
            tempFirstCoordinator,
            tempSecondCoordinator,
            tempThirdCoordinator
        ]
        .map { coordinator -> UIViewController in
            let scene = coordinator.toPresentable

            if let scene = scene {
                tabs[scene] = coordinator
                return scene
            }
            else {
                fatalError("Unable to get toPresentable from the coordinator, make sure you set you implemented toPresentable in the right way")
            }
        }
        
        
//        MARK: Temp code, need to remove later on
        let scene = UIViewController()
        let navigationScene = UINavigationController(rootViewController: scene)
        
        scene.view.backgroundColor = .yellow
        navigationScene.tabBarItem = .init(
            title: "3 Scene",
            image: nil,
            tag: 3
        )
        
        scenes.append(navigationScene)
                
        tabBarScene.setViewControllers(scenes, animated: true)
    }
}
