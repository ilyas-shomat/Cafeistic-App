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
//        networkApiService.load<LoginEntityOut>(target: target) { (data, error) in
//            print("/// data:", data)
//            print("/// error:", error)
//        }
        networkApiService.load(target: target, jsonType: LoginEntityOut.self) { (data, error) in
            print("/// data:", data)
            print("/// error:", error)
        }
    }
}
