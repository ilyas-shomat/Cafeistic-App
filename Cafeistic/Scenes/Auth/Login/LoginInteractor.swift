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
    
    init(networkApiService: Networkable) {
        self.networkApiService = networkApiService
        
        sendWithAuthData(loginEntityIn: LoginEntityIn(username: "first_user", password: "first_user"))
    }
    
    private func sendWithAuthData(loginEntityIn: LoginEntityIn) {
        let target = AuthTarget.login(loginEntityIn: loginEntityIn)
        networkApiService.load(target: target, jsonType: LoginEntityOut.self) { (result) in
            switch result {
            case .success(let data):
                print("/// data:", data)
            case .failure(let error):
                print("/// error:", error)
            }
        }
    }
}
