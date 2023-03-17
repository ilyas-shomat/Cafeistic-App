//
//  Routable.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 13.03.2023.
//

import Foundation
import UIKit

protocol Routable: Presentable {
    var navigationScene: NavigationScene { get set }
    
    func setRootScene(_ scene: Presentable?)

    func present(_ scene: Presentable?, animated: Bool, completion: CompletionHandler?)
    
    func push(_ scene: Presentable?, animated: Bool, completion: CompletionHandler?)
//    
//    func popScene(animated: Bool)
//    
//    func dismissScene(animated: Bool, completion: CompletionHandler?)
//    
    
//    func popToRootScene(animated: Bool)
}

extension Routable {
    func setRootScene(_ scene: Presentable?) {
        guard let presentable = scene?.toPresentable,
              let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window
        else {
            return
        }
        
        navigationScene.setViewControllers([presentable], animated: false)

        UIView.transition(
            with: window,
            duration: 0.5,
            options: .transitionCrossDissolve
        ) { [weak window] in
            window?.rootViewController = navigationScene
            window?.makeKeyAndVisible()
        }
    }
    
    func present(_ scene: Presentable?, animated: Bool = true, completion: CompletionHandler? = nil) {
        guard let presentable = scene?.toPresentable else { return }
        navigationScene.present(presentable, animated: animated, completion: completion)
    }
    
    func push(_ scene: Presentable?, animated: Bool, completion: CompletionHandler? = nil) {
        guard let presentable = scene?.toPresentable,
              presentable !== NavigationScene.self
        else {
            return
        }
        
        navigationScene.pushViewController(presentable, animated: true)
    }
}
