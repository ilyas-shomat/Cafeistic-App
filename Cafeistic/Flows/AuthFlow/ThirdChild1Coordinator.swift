//
//  TempThirdChild1Coordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.03.2023.
//

import Foundation

//protocol ThirdChild1CoordinatorDelegate: CoordinatableDelagate {
//
//}

protocol ThirdChild1CoordinatorDelegate {
    func navigate_From_ThirdChild1_To_ThirdChild1Detail()
}

final class ThirdChild1Coordinator: Coordinator {
    override var root: Presentable { getThirdChild1Scene() }
    
    private func getThirdChild1Scene() -> Presentable {
        let scene = ThirdChild1Scene()
        scene.coordinatorDelegate = self
        return scene
    }
    
    private func getThirdChild1DetailScene() -> Presentable {
        let scene = ThirdChild1DetailScene()
        scene.coordinatorDelegate = self
        return scene
    }
}

extension ThirdChild1Coordinator: ThirdChild1CoordinatorDelegate {
    func navigate_From_ThirdChild1_To_ThirdChild1Detail() {
        router.push(getThirdChild1DetailScene(), animated: true)
    }
}
