//
//  TempFirstCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 17.03.2023.
//

import Foundation

protocol TempFirstCoordinatorDelegate: CoordinatableDelagate {
    func navigateFromTempFirstSceneToTempFirstDetailScene()
    func navigateFromTempFirstSceneToItself()
    func popFromTempFristDetailSceneToTempFirstScene()
}

final class TempFirstCoordinator: Coordinator {
    override var root: Presentable { getTempFirstScene() }
    
    var flowCompletion: CompletionHandler?
    
    init(coordinatingType: CoordinatingType, completion: @escaping CompletionHandler) {
        super.init(coordinatingType: coordinatingType, completion: completion)
        flowCompletion = completion
    }
    
    private func getTempFirstScene() -> Presentable {
        let scene = TempFirstScene()
        scene.coordinatorDelegate = self
        return scene
    }
    
    private func getTempFirstDetailScene() -> Presentable {
        let scene = TempFirstDetailScene()
        scene.coordinatorDelegate = self
        return scene
    }
}

extension TempFirstCoordinator: TempFirstCoordinatorDelegate {
    func navigateFromTempFirstSceneToTempFirstDetailScene() {
        router.push(getTempFirstDetailScene(), animated: true)
    }
    
    func navigateFromTempFirstSceneToItself() {
        router.push(getTempFirstDetailScene(), animated: true)
    }
    
    func popFromTempFristDetailSceneToTempFirstScene() {
        router.popScene(animated: true)
    }
}
