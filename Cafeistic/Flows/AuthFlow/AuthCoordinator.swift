//
//  AuthCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.03.2023.
//

import Foundation

protocol AuthCoordinatorDelegate: CoordinatableDelagate {
    func navigateFromSignInToSignUp()
}
 
final class AuthCoordinator: Coordinator {
//    override var root: Presentable { SignInScene.initiate() }
        
    override var root: Presentable {
        let scene = TempSignInScene()
        scene.coordinatorDelegate = self
        return scene
    }
    
    var flowCompletion: CompletionHandler?

    init(completion: @escaping CompletionHandler) {
        super.init()
        flowCompletion = completion
        bindDeeplinks()
    }
    
    private func bindDeeplinks() {
//        deeplinkSubject
//            .receive(on: DispatchQueue.main)
//            .sink{ [weak self] (coordinatable, navigationType) in
//                switch coordinatable {
//                case let coordinator as AuthCoordinator:
//                    print("coordinator", coordinator)
//                default: ()
//                }
//
//            }
//            .store(in: &cancellables)
    }
    private func getTempSignUpScene() -> TempSignUpScene {
        let scene = TempSignUpScene()
        scene.authCoordinatorDelegate = self
        return scene
    }
}

extension AuthCoordinator: AuthCoordinatorDelegate {
    
    func navigateFromSignInToSignUp() {
        router.push(getTempSignUpScene(), animated: true)
    }
    
    func onCompleteFlow() {
//        completion()
//        deeplinkSubject.send((self, .setRoot))
    }
}
