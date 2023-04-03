//
//  TempThirdChild2Coordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.03.2023.
//

import Foundation

protocol ThirdChild2CoordinatorDelegate {
    func navigateFrom_ThirdChild2Scene_ThirdChild2DetailScene()
    func finishFlow()
}

final class ThirdChild2Coordinator: Coordinator {
    override var root: Presentable { getThirdChild2Scene() }
    
    private func getThirdChild2Scene() -> Presentable {
        let scene = ThirdChild2Scene()
        scene.coordinatorDelegate = self
        return scene
    }
    
    private func getThirdChild2DetailScene() -> Presentable {
        let scene = ThirdChild2DetailScene()
        scene.coordinatorDelegate = self
        return scene
    }
}

extension ThirdChild2Coordinator: ThirdChild2CoordinatorDelegate {
    func navigateFrom_ThirdChild2Scene_ThirdChild2DetailScene() {
        router.push(getThirdChild2DetailScene(), animated: true, completion: nil)
    }
    
    func finishFlow() {
        router.dismissScene(animated: true)
        completion?()
    }
}
