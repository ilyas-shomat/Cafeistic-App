//
//  Coordinatable.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 13.03.2023.
//

import Foundation
import UIKit
import Combine

enum CoordinatingType {
    case newFlow
    case currentFlow(NavigationType? = nil)
}

enum NavigationType {
    case present
    case push
}

protocol Coordinatable: AnyObject, Presentable {
    var root: Presentable { get }
    var router: Routable { get set }
    var coordinatingType: CoordinatingType { get set }
    var childCoordinators: [Coordinatable] { get set }
    
//    MARK: called when flow finishes its task
    var completion: CompletionHandler? { get set }
        
    func run()
    func runNewFlow()
    func proceedCurrentFlow(navigationType: NavigationType)
    
//    MARK: function usable when you cannot use 'run()' function, like in TabViewController's tabs
    func setRouterWithRootScene()
    
    func addChild(_ coordinator: Coordinatable)
    func removeChild(_ coordinator: Coordinatable)    
}

extension Coordinatable {
    var toPresentable: UIViewController? {
        switch coordinatingType {
        case .newFlow:
            return root.toPresentable
        case .currentFlow:
            return router.toPresentable
        }
    }
    
//    MARK need to implement for AppCoordinator
    func run() {
        switch coordinatingType {
        case .newFlow:
            runNewFlow()
        case .currentFlow(let navigationType):
            guard let navigationType = navigationType else { return }
            proceedCurrentFlow(navigationType: navigationType)
        }
    }
    
    func runNewFlow() {
        router.setRootScene(root)
    }
    
    func proceedCurrentFlow(navigationType: NavigationType) {
        switch navigationType {
        case .push: pushNewFlow()
        case .present: presentNewFlow()
        }
    }
    
    private func pushNewFlow() {
        router.push(root, animated: true, completion: completion)
    }
    
    private func presentNewFlow() {
        guard let toPresentable = root.toPresentable else { return }
        let navigatioScene: NavigationScene = .init(rootViewController: toPresentable)
        router.present(navigatioScene, animated: true)
        router = Router(navigationScene: navigatioScene)
        router.completions[navigatioScene] = completion
    }
    
    func setRouterWithRootScene() {
        router.setRootPresentable(root)
    }
    
    func addChild(_ coordinator: Coordinatable) {
        for element in childCoordinators {
            if element === coordinator { return }
        }

        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinatable) {
        guard !childCoordinators.isEmpty else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

