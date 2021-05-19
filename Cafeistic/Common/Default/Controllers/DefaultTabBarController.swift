//
//  DefaultTabBarController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 19.05.2021.
//

import Foundation
import UIKit

final class DefaultTabBarController: UITabBarController {
    
    var type: TabBarControlerType?
    
    init(type: TabBarControlerType) {
        super.init(nibName: nil, bundle: nil)
        self.type = type
        setupScenes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            setupEstablishmentMain()
        case .client:
            setupClienMain()
        default:
            return
        }
    }
    
    private func setupClienMain() {
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
        
        viewControllers = [menuScene, secondScene, thirdScene, fourthScene]
    }
    
    private func setupEstablishmentMain() {
        
    }
}
