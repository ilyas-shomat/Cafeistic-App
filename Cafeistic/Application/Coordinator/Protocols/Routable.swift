//
//  Routable.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 13.03.2023.
//

import Foundation
import UIKit

protocol Routable: Presentable {
    var navigationScene: NavigationScene? { get set }
    var completions: [UIViewController: CompletionHandler] { get set }
    
    func setRootPresentable(_ presentable: Presentable)
    func setRootScene(_ scene: Presentable?)

    func push(_ scene: Presentable?, animated: Bool, completion: CompletionHandler?)
    func present(_ scene: Presentable?, presentationStyle: UIModalPresentationStyle?, animated: Bool)
    
    func popScene(animated: Bool)
    func dismissScene(animated: Bool, completion: CompletionHandler?)
        
    func saveSceneCompletion(scene: UIViewController, completion: @escaping () -> Void)
    func removeNavigationScene()
}

extension Routable {
    var toPresentable: UIViewController? { navigationScene }
    
    func setRootPresentable(_ presentable: Presentable) {
        guard let navigationScene = navigationScene,
              let toPresentable = presentable.toPresentable
        else { return }

        navigationScene.setViewControllers([toPresentable], animated: false)
    }
    
    func setRootScene(_ scene: Presentable?) {
        guard let presentable = scene?.toPresentable,
              let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window
        else {
            return
        }
        
        var rootPresentable = presentable
        
        if let navigationScene = navigationScene {
            navigationScene.setViewControllers([presentable], animated: false)
            rootPresentable = navigationScene
        }

        UIView.transition(
            with: window,
            duration: 0.5,
            options: .transitionCrossDissolve
        ) { [weak window] in
            
            window?.rootViewController = rootPresentable
            window?.makeKeyAndVisible()
        }
    }
    
    func present(_ scene: Presentable?, presentationStyle: UIModalPresentationStyle? = nil, animated: Bool = true) {
        guard let presentable = scene?.toPresentable else { return }
        
        if let presentationStyle = presentationStyle {
            presentable.modalPresentationStyle = presentationStyle
        }
        
        navigationScene?.present(presentable, animated: animated)
    }
    
    func push(_ scene: Presentable?, animated: Bool, completion: CompletionHandler? = nil) {
        guard let presentable = scene?.toPresentable,
              presentable !== NavigationScene.self
        else {
            return
        }
        
        if let completion = completion {
            saveSceneCompletion(scene: presentable, completion: completion)
        }
        
        navigationScene?.pushViewController(presentable, animated: true)
    }
    
    func popScene(animated: Bool) {
        navigationScene?.popViewController(animated: animated)
    }
    
    func dismissScene(animated: Bool, completion: CompletionHandler? = nil) {
        navigationScene?.dismiss(animated: animated)
    }
}
