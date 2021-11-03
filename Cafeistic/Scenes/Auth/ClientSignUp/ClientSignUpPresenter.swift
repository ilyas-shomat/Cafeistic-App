//
//  ClientSignUpPresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class ClientSignUpPresenter: ViewToPresenterClientSignUpProtocol {
    
    var view: PresenterToViewClientSignUpProtocol?
    var interactor: PresenterToInteractorClientSignUpProtocol?
    var router: PresenterToRouterClientSignUpProtocol?
    
    func load() {
        
    }
    
    func handleSignUpTap(
        fullName: String,
        username: String,
        password: String,
        email: String
    ) {
//        var
//        interactor?.signUp(userSignUpEntity: <#T##UserSignUpEntity#>)
    }
}

// MARK: - (Interactor -> Presenter)
extension ClientSignUpPresenter: InteractorToPresenterClientSignUpProtocol {
    
}
