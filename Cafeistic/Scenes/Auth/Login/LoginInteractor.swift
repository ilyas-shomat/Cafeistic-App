//
//  LoginInteractor.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//  
//

import Foundation

// MARK: - (Presenter -> Interactor)
class LoginInteractor: PresenterToInteractorLoginProtocol {

    var presenter: InteractorToPresenterLoginProtocol?
    var networkApiService: Networkable
    var sessionTracker: SessionTracker
    
    init(networkApiService: Networkable, sessionTracker: SessionTracker) {
        self.networkApiService = networkApiService
        self.sessionTracker = sessionTracker
//        sendWithAuthData(loginEntityIn: LoginEntityIn(username: "first_user", password: "first_user"))
    }
    
    func loginWithData(loginEntity: LoginEntity) {
        let loginEntityIn = LoginEntityIn(username: loginEntity.username,
                                          password: loginEntity.password)
        postWithAuthData(loginEntityIn: loginEntityIn)
    }
    
    private func postWithAuthData(loginEntityIn: LoginEntityIn) {
        let target = AuthTarget.login(loginEntityIn: loginEntityIn)
        networkApiService.load(target: target, jsonType: LoginEntityOut.self) { (result) in
            switch result {
            case .success(let data):
                guard let token = data?.token else {
                    return
                }
                self.sessionTracker.updateToken(token: token)
            case .failure(let error):
                print("/// error:", error)
            }
        }
    }
}
