//
//  SignInScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 02.02.2023.
//

import UIKit
import Foundation
import LiteNet

final class SignInScene: Scene {
    var interactor: SingInInteractorDelegate?
    var coordinator: SignInCoordinatorDelegate?
    
    private lazy var signInView: SignInView = .init(triggerAction: handleViewActions)
    
    override func loadView() {
        self.view = signInView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func handleViewActions(action: SignInViewActions) {
        switch action {
        case .signInButtonTapped(let login, let password):
            handleSignInButtonTap(login: login, password: password)
        case .signUpButtonTapped: handleSignUpButtonTap()
        case .forgetPasswordTapped: handleForgetPasswordTap()
        }
    }
    
    private func handleSignInButtonTap(login: String, password: String) {
        guard checkLoginAndPassword(login: login, password: password) else {
            return
        }
        
        interactor?.authorize(entity: .init(username: login, password: password))
    }
    
    private func handleSignUpButtonTap() {
        
    }
    
    private func handleForgetPasswordTap() {
        
    }
    
    private func checkLoginAndPassword(login: String, password: String) -> Bool {
        if login.isEmpty || password.isEmpty {
            showAlert(
                title: StringConstant.Services.AlertMessage.error,
                message: StringConstant.Services.AlertMessage.someEmptyFieldsExist
            )
            return false
        }
        
        return true
    }
}

extension SignInScene: SignInSceneDelegate {
    func tokenLoaded() {
        
    }
}

extension SignInScene {
    class func initiate(coordinator: SignInCoordinatorDelegate? = nil) -> SignInScene {
        let networkService = AppInitializer.serloc.getService(LiteNetProtocol.self)
        
        let scene = SignInScene()
        var interactor: SingInInteractorDelegate = SignInInteractor(
            networkService: networkService,
            cancellables: scene.cancellables
        )
        
        interactor.scene = scene
        scene.interactor = interactor
        scene.coordinator = coordinator
        
        return scene
    }
}
