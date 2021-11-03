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
    }
    
    func loginWithData(loginEntity: LoginEntity) {
        let loginEntityIn = LoginEntityRequest(
            username: loginEntity.username,
            password: loginEntity.password
        )
        postWithAuthData(loginEntityRequest: loginEntityIn)
    }
    
    func postWithAuthData(loginEntityRequest: LoginEntityRequest) {
        let target = AuthTarget.login(loginEntityIn: loginEntityRequest)
        networkApiService.load(target: target, jsonType: LoginEntityResponse.self) { (result) in
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
