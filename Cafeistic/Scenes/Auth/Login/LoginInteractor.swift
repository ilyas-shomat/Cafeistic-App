//
//  LoginInteractor.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//  
//

import Foundation
import Combine

// MARK: - (Presenter -> Interactor)
class LoginInteractor: PresenterToInteractorLoginProtocol {

    var presenter: InteractorToPresenterLoginProtocol?
    var networkService: Networkable
    var sessionTracker: SessionTracker
    var cancellable = Set<AnyCancellable>()
    
    init(networkService: Networkable, sessionTracker: SessionTracker) {
        self.networkService = networkService
        self.sessionTracker = sessionTracker
        
//        bindWithServices()
    }
    
//    private func bindWithServices() {
//        networkService.publisher
//            .receive(on: DispatchQueue.main)
//            .sink (
//                receiveCompletion: { completion in
//                    guard case let .failure(error) = completion else { return }
//                    self.presenter?.errorAuthorized(error: error.message)
//                },
//                receiveValue: { data in
//                    guard
//                        let data = data as? LoginEntityResponse,
//                        let token = data.token
//                    else {
//                        return
//                    }
//
//                    self.sessionTracker.updateToken(token: token)
//                    self.presenter?.successAuthorized()
//                }
//            )
//            .store(in: &cancellable)
//    }
    
    func loginWithData(loginEntity: LoginEntity) {
        let loginEntityRequest = LoginEntityRequest(
            username: loginEntity.username,
            password: loginEntity.password
        )
//        postWithAuthDataAsync(loginEntityRequest: loginEntityRequest)
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
    
//    func postWithAuthDataAsync(loginEntityRequest: LoginEntityRequest) {
//        let target = AuthTarget.login(loginEntityRequest: loginEntityRequest)
//        networkService.loadAsync(target: target, jsonType: LoginEntityResponse.self)
//    }
}
