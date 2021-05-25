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
        switch type {
        case .establishment:
            viewControllers = setupEstablishmentMain()
        case .client:
            viewControllers = setupClienMain()
        default:
            return
        }
    }
    
    private func setupClienMain() -> [UIViewController] {
        let menuScene = MenuScene.initiate()
        let menuNavigationController = DefaultNavigationController()
        menuNavigationController.setViewControllers([menuScene], animated: false)
        menuScene.navigationController?.tabBarItem  = UITabBarItem(title: "",
                                                                   image: Assets.menuUnselectedTabBar.image,
                                                                   selectedImage: Assets.menuTabBar.image)
        
        
        let clientCurrentOrderScene = ClientCurrentOrderScene.initiate()
        let clientCurrentOrderNavigationController = DefaultNavigationController()
        clientCurrentOrderNavigationController.setViewControllers([clientCurrentOrderScene], animated: false)
        clientCurrentOrderScene.navigationController?.tabBarItem = UITabBarItem(title: "",
                                                                                image: Assets.currentOrderUnselectedTabBar.image,
                                                                                selectedImage: Assets.currentOrderTabBar.image)
        
        let thirdScene = UIViewController()
        thirdScene.view.backgroundColor = .yellow
        thirdScene.tabBarItem.title = "История"

        let fourthScene = UIViewController()
        fourthScene.view.backgroundColor = .green
        fourthScene.tabBarItem.title = "Профиль"
        
        let scenes = [menuNavigationController, clientCurrentOrderNavigationController, thirdScene, fourthScene]
        
        return scenes
    }
    
    private func setupEstablishmentMain() -> [UIViewController]  {
        return []
    }
}
