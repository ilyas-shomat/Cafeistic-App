//
//  AuthCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.03.2023.
//

import Foundation

protocol AuthCoordinatorDelegate {
    func finishFlow()
    func navigateFrom_SignIn_To_SignUp()
}
 
final class AuthCoordinator: Coordinator {
    override var root: Presentable {
        let scene = TempSignInScene()
        scene.coordinatorDelegate = self
        return scene
    }
    
    init() {
        super.init()
    }
    
    private func getTempSignUpScene() -> TempSignUpScene {
        let scene = TempSignUpScene()
        scene.authCoordinatorDelegate = self
        return scene
    }
}

extension AuthCoordinator: AuthCoordinatorDelegate {
    func navigateFrom_SignIn_To_SignUp() {
        router.push(getTempSignUpScene(), animated: true)
    }
    
    func finishFlow() {
        completion?()
    }
}
