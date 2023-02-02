//
//  Router.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 18.08.2022.
//

import Foundation
import UIKit

class Router: NSObject, Presentable, UINavigationControllerDelegate {
    private var completions: [UIViewController: () -> Void]
    private let navigationScene: UINavigationController

    init(navigationScene: UINavigationController = UINavigationController()) {
        self.navigationScene = navigationScene
        self.completions = [:]
        super.init()
        self.navigationScene.delegate = self
    }
    
    func toPresentable() -> UIViewController {
        return navigationScene
    }

    deinit {
        if let presented = navigationScene.presentedViewController{
            dismiss(presented)
        }
    }

    func present(_ presentable: Presentable, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationScene.present(
            presentable.toPresentable(),
            animated: animated,
            completion: completion
        )
    }

    func dismiss(_ presentable: Presentable, animated: Bool = true, completion: (() -> Void)? = nil) {
        if navigationScene.presentedViewController == presentable.toPresentable() {
            navigationScene.dismiss(animated: animated, completion: completion)
        }
    }

    func dismiss(coordinator: Coordinator, animated: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(coordinator.toPresentable())
    }

    func push(
        _ presentable: Presentable,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        let controller = presentable.toPresentable()
        
        guard controller is UINavigationController == false else {
            return
        }

        if let completion = completion {
            completions[controller] = completion
        }

        navigationScene.pushViewController(controller, animated: animated)
    }

    func pop(animated: Bool = true) {
        if let controller = navigationScene.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func setRoot(_ presentable: Presentable, completion: (() -> Void)? = nil) {
        // Call all completions so all coordinators can be deallocated
        for controller in navigationScene.viewControllers {
            runCompletion(for: controller)
        }

        let controller = presentable.toPresentable()

        if let vc = controller as? UINavigationController {
            navigationScene.setViewControllers(vc.viewControllers, animated: false)
            if let completion = completion {
                vc.viewControllers.forEach { completions[$0] = completion }
            }
        } else {
            navigationScene.setViewControllers([controller], animated: false)
            if let completion = completion {
                completions[controller] = completion
            }
        }
    }

    func popToRoot(animated: Bool) {
        if let controllers = navigationScene.popToRootViewController(animated: animated) {
            controllers.forEach { runCompletion(for: $0) }
        }
    }

    func popTo(_ presentable: Presentable, animated: Bool = true) {
        if let controllers = navigationScene.popToViewController(presentable.toPresentable(), animated: animated) {
            controllers.forEach { runCompletion(for: $0) }
        }
    }

    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }

    // MARK: UINavigationControllerDelegate

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Ensure the view controller is popping
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
                return
        }

        runCompletion(for: poppedViewController)
    }
}
