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
    case currentFlow
}

enum NavigationType {
    case setRoot
    case present
    case push
}

protocol Coordinatable: AnyObject, Presentable {
//    var deeplinkSubject: PassthroughSubject<String?, Never> { get set }
    
    var deeplinkSubject: PassthroughSubject<(Coordinatable, NavigationType), Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    
    var root: Presentable { get }
    var router: Routable { get set }
    var coordinatingType: CoordinatingType { get set }
    var childCoordinators: [Coordinatable] { get set }
    
//    MARK: called when flow finish its task
    var completion: CompletionHandler { get set }
    
//    func bindDeeplinks()
    
    func run()
    func runNewFlow()
    func proceedCurrentFlow()
    
//
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
    
//    func bindDeeplinks() {
//        deeplinkSubject
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] coordinatable, navigationType in
//
//            }
//            .store(in: &cancellables)
//    }
    
//    MARK need to implement for AppCoordinator
    func run() {
        switch coordinatingType {
        case .newFlow:
            runNewFlow()
        case .currentFlow:
            proceedCurrentFlow()
        }
    }
    
    func runNewFlow() {
        router.setRootScene(root)
    }
    
    func proceedCurrentFlow() {
        
    }
    
    func setRouterWithRootScene() {
        router.setRootPresentable(root)
    }
    
    func addChild(_ coordinator: Coordinatable) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        
//        deeplinkSubject
//            .subscribe(coordinator.deeplinkSubject)
//            .store(in: &coordinator.cancellables)

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

