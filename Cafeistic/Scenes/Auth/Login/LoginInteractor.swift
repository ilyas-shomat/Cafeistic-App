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
    var networkService: Networkable
    var sessionTracker: SessionTracker
    
    init(networkService: Networkable, sessionTracker: SessionTracker) {
        self.networkService = networkService
        self.sessionTracker = sessionTracker
    }
    
    func loginWithData(loginEntity: LoginEntity) {
        let loginEntityRequest = LoginEntityRequest(
            username: loginEntity.username,
            password: loginEntity.password
        )
        postWithAuthData(loginEntityRequest: loginEntityRequest)
    }
    
    func postWithAuthData(loginEntityRequest: LoginEntityRequest) {
        let target = AuthTarget.login(loginEntityRequest: loginEntityRequest)
        networkService.load(target: target, jsonType: LoginEntityResponse.self) { (result) in
            switch result {
            case .success(let data):
                guard let token = data?.token else {
                    return
                }
                self.sessionTracker.updateToken(token: token)
                self.presenter?.successAuthorized()
            case .failure(let error):
                self.presenter?.errorAuthorized(error: error?.message ?? "")
            }
        }
    }
}
