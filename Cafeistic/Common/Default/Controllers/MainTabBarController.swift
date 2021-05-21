//
//  DefaultTabBarController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 19.05.2021.
//

import Foundation
import UIKit

final class MainTabBarController: UITabBarController {
    
    var type: TabBarControlerType?
    
    init(type: TabBarControlerType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScenes()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.tabBar.tintColor = .appOrange
    }
    
    private func setupScenes() {
        var scenes: [UIViewController] = []
        
        switch type {
        case .establishment:
            scenes = setupEstablishmentMain()
        case .client:
            scenes = setupClienMain()
        default:
            return
        }
        
        viewControllers = scenes.map { scene in
            let navigationController = DefaultNavigationController()
            navigationController.setViewControllers([scene], animated: false)
            return navigationController
        }
    }
    
    private func setupClienMain() -> [UIViewController] {
        let menuScene = MenuScene.initiate()
        menuScene.tabBarItem.title = "Меню"
        
        let secondScene = UIViewController()
        secondScene.view.backgroundColor = .blue
        secondScene.tabBarItem.title = "Заказ"
        
        let thirdScene = UIViewController()
        thirdScene.view.backgroundColor = .yellow
        thirdScene.tabBarItem.title = "История"

        let fourthScene = UIViewController()
        fourthScene.view.backgroundColor = .green
        fourthScene.tabBarItem.title = "Профиль"
        
        let scenes = [menuScene, secondScene, thirdScene, fourthScene]
        
        return scenes
    }
    
    private func setupEstablishmentMain() -> [UIViewController]  {
        return []
    }
}
