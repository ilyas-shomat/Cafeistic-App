//
//  ClientSignUpInteractor.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import Foundation
//import Light
import LiteNet

// MARK: - (Presenter -> Interactor)
class ClientSignUpInteractor: PresenterToInteractorClientSignUpProtocol {

    var presenter: InteractorToPresenterClientSignUpProtocol?
    var networkApiService: LiteNetProtocol

    init(networkApiService: LiteNetProtocol) {
        self.networkApiService = networkApiService
    }
    
    func signUp(signUpEntity: SignUpEntity) {
        let signUpEntityRequest = SignUpEntityRequest(
            fullName: signUpEntity.fullName,
            username: signUpEntity.username,
            password: signUpEntity.password,
            email: signUpEntity.email
        )
        postWithSignUpData(signUpEntityRequest: signUpEntityRequest)
    }
    
    func postWithSignUpData(signUpEntityRequest: SignUpEntityRequest) {
//        let target = AuthTarget.clientSignUp(signUpEntityRequest: signUpEntityRequest)
//        networkApiService.load(target: target, jsonType: SignUpEntityResponse.self) { (result) in
//            switch result {
//            case .success(let data):
//                if let errorMessage = data?.errorMessage?.first {
//                    consolePrint(errorMessage)
//                }
//                else {
//                    consolePrint(data)
//                }
//            case .failure(let error):
//                consolePrint(error?.message)
//            }
//        }
    }
}
