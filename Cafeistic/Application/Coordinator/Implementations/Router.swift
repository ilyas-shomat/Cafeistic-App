//
//  Router.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 13.03.2023.
//

import Foundation
import UIKit

final class Router: NSObject, Routable {
    var navigationScene: NavigationScene?
    var completions: [UIViewController : CompletionHandler] = .init()

    init(navigationScene: NavigationScene? = .init()) {
        super.init()
        self.navigationScene = navigationScene
        self.navigationScene?.delegate = self
        self.navigationScene?.presentationController?.delegate = self
    }
    
    func saveSceneCompletion(scene: UIViewController, completion: @escaping () -> Void) {
        completions[scene] = completion
    }
}

extension Router: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard
            let navigationScene = navigationScene,
            let poppedScene = navigationScene.transitionCoordinator?.viewController(forKey: .from),
            let completion = completions[poppedScene],
            !navigationScene.viewControllers.contains(poppedScene) else { return }
        
        completions.removeValue(forKey: poppedScene)
        completion()
    }
    
    func removeNavigationScene() {
        navigationScene = nil
    }
}

extension Router: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        let dismissedViewController = presentationController.presentedViewController
        guard let completion = completions[dismissedViewController] else { return }

        completions.removeValue(forKey: dismissedViewController)
        completion()
    }
}
