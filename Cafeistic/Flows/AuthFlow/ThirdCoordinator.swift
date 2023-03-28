//
//  TempThirdCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 20.03.2023.
//

import Foundation

protocol ThirdCoordinatorDelegate: CoordinatableDelagate {
    func navigateToThirdChild1()
}

final class ThirdCoordinator: Coordinator {
    override var root: Presentable { getTempThirdScene() }
    var flowCompletion: CompletionHandler?
    
    init(coordinatingType: CoordinatingType, completion: @escaping CompletionHandler) {
        super.init(coordinatingType: coordinatingType)
        flowCompletion = completion
    }
    
    private func getTempThirdScene() -> Presentable {
        let scene = TempThirdScene()
        scene.coordinatorDelegate = self
        return scene
    }
}

extension ThirdCoordinator: ThirdCoordinatorDelegate {
    func navigateToThirdChild1() {
        let coordinator: ThirdChild1Coordinator = .init(
            router: router,
            coordinatingType: .currentFlow(.push)
        )
                
        coordinator.completion = { [weak self, weak coordinator] in
            guard let self = self, let coordinator = coordinator else { return }
            self.removeChild(coordinator)
        }
                
        addChild(coordinator)
        coordinator.run()
    }
}
