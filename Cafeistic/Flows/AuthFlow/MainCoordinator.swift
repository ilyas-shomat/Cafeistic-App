//
//  CustomerMainCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.03.2023.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate: CoordinatableDelagate {

}

final class MainCoordinator: Coordinator {
    private lazy var tempFirstCoordinator: TempFirstCoordinator = {
        let coordinator = TempFirstCoordinator(
            coordinatingType: .currentFlow,
            completion: {}
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
    
    private lazy var tempSecondCoordinator: TempSecondCoordinator = {
        let coordinator = TempSecondCoordinator(
            coordinatingType: .currentFlow,
            completion: {}
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
    
    private let tabBarScene: UITabBarController = .init()
    private var tabs: [UIViewController: Coordinator] = .init()
    
    override var root: Presentable {
        return tabBarScene
    }

    var flowCompletion: CompletionHandler?

    init(
        router: Router = .init(navigationScene: nil),
        completion: @escaping CompletionHandler
    ) {
        super.init(router: router, completion: completion)
        flowCompletion = completion
        setupTabbarScene()
    }
    
    private func setupTabbarScene() {
        tabBarScene.tabBar.tintColor = .red
        tabBarScene.tabBar.unselectedItemTintColor = .black
        tabBarScene.tabBar.backgroundColor = .appGray
        
        var scenes: [UIViewController] = [
            tempFirstCoordinator,
            tempSecondCoordinator
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
        let tempColors: [UIColor] = [.blue, .orange, .yellow]
        
        for i in 0...1 {
            let scene = UIViewController()
            let navigationScene = UINavigationController(rootViewController: scene)
            
            scene.view.backgroundColor = tempColors[i]
            navigationScene.tabBarItem = .init(
                title: "\(i+2) Scene",
                image: nil,
                tag: i+1
            )
            
            scenes.append(navigationScene)
        }
                
        tabBarScene.setViewControllers(scenes, animated: true)
//        print("tabBarScene.viewControllers", tabBarScene.viewControllers)
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
}
