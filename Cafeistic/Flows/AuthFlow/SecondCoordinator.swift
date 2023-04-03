//
//  TempSecondCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 20.03.2023.
//

import Foundation


protocol SecondCoordinatorDelegate {
    func navigateFrom_TempSecondScene_To_TempSecondDetailScene()
    func dismissFrom_TempSecondDetailScene_To_TempSecondScene()
}

final class SecondCoordinator: Coordinator {
    override var root: Presentable { getTempSecondScene() }
        
    init(coordinatingType: CoordinatingType) {
        super.init(coordinatingType: coordinatingType)
    }
    
    private func getTempSecondScene() -> Presentable {
        let scene = SecondScene()
        scene.coordinatorDelegate = self
        return scene
    }
    
    private func getTempSecondDetailScene() -> Presentable {
        let scene = SecondDetailScene()
        scene.coordinatorDelegate = self
        return scene
    }
}

extension SecondCoordinator: SecondCoordinatorDelegate {
    func navigateFrom_TempSecondScene_To_TempSecondDetailScene() {
        router.present(getTempSecondDetailScene(), animated: true)
//        router.present(getTempSecondDetailScene(), presentationStyle: .overFullScreen, animated: true) // for FullScreen presentation
    }
    
    func dismissFrom_TempSecondDetailScene_To_TempSecondScene() {
        router.dismissScene(animated: true)
    }
}
