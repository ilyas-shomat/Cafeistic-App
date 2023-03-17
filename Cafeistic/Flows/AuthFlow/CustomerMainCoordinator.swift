//
//  CustomerMainCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.03.2023.
//

import Foundation

protocol CustomerMainCoordinatorDelegate: CoordinatableDelagate {
    
}

final class CustomerMainCoordinator: Coordinator {
    override var root: Presentable {
        let scene = TempFirstScene()
        scene.coordinatorDelegate = self
        return scene
    }
    
    var flowCompletion: CompletionHandler?
    
    init(completion: @escaping CompletionHandler) {
        super.init(completion: completion)
        flowCompletion = completion
//        bindDeeplinks()
    }
}

extension CustomerMainCoordinator: CustomerMainCoordinatorDelegate {
    func onCompleteFlow() {
        completion()
    }
}
