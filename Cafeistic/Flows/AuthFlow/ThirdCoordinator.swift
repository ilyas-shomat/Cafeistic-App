//
//  ThirdCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 20.03.2023.
//

import Foundation

protocol ThirdCoordinatorDelegate {
    func navigateFrom_ThirdScene_To_ThirdChild1Scene()
    func navigateFrom_ThirdScene_To_ThirdChild2Scene()
}

final class ThirdCoordinator: Coordinator {
    override var root: Presentable { getTempThirdScene() }
    
    init(coordinatingType: CoordinatingType) {
        super.init(coordinatingType: coordinatingType)
    }
    
    private func getTempThirdScene() -> Presentable {
        let scene = ThirdScene()
        scene.coordinatorDelegate = self
        return scene
    }
}

extension ThirdCoordinator: ThirdCoordinatorDelegate {
    func navigateFrom_ThirdScene_To_ThirdChild1Scene() {
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
    
    func navigateFrom_ThirdScene_To_ThirdChild2Scene() {
        let coordinator: ThirdChild2Coordinator = .init(
            router: router,
            coordinatingType: .currentFlow(.present)
        )
                
        coordinator.completion = { [weak self, weak coordinator] in
            guard let self = self, let coordinator = coordinator else { return }
            self.removeChild(coordinator)
            coordinator.router.removeNavigationScene()
        }
                
        addChild(coordinator)
        coordinator.run()
    }
}
