//
//  TempFirstCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 17.03.2023.
//

import Foundation

protocol FirstCoordinatorDelegate {
    func navigateFrom_TempFirstScene_To_TempFirstDetailScene()
    func navigateFrom_TempFirstScene_To_Itself()
    func popFrom_TempFristDetailScene_To_TempFirstScene()
}

final class FirstCoordinator: Coordinator {
    override var root: Presentable { getTempFirstScene() }
        
    init(coordinatingType: CoordinatingType) {
        super.init(coordinatingType: coordinatingType)
    }
    
    private func getTempFirstScene() -> Presentable {
        let scene = FirstScene()
        scene.coordinatorDelegate = self
        return scene
    }
    
    private func getTempFirstDetailScene() -> Presentable {
        let scene = FirstDetailScene()
        scene.coordinatorDelegate = self
        return scene
    }
}

extension FirstCoordinator: FirstCoordinatorDelegate {
    func navigateFrom_TempFirstScene_To_TempFirstDetailScene() {
        router.push(getTempFirstDetailScene(), animated: true)
    }
    
    func navigateFrom_TempFirstScene_To_Itself() {
        router.push(getTempFirstDetailScene(), animated: true)
    }
    
    func popFrom_TempFristDetailScene_To_TempFirstScene() {
        router.popScene(animated: true)
    }
}
