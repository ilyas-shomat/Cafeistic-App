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
    
    var signUpEntity: SignUpEntity? 
    
    func load() {}
    
    func handleSignUpTap(
        fullName: String,
        username: String,
        password: String,
        repeatedPassword: String,
        email: String
    ) {
        checkEnteringUserData(
            fullName: fullName,
            username: username,
            password: password,
            repeatedPassword: repeatedPassword,
            email: email
        )
        guard let signUpEntity = signUpEntity else {
            return
        }
        interactor?.signUp(signUpEntity: signUpEntity)
    }
    
    private func checkEnteringUserData(
        fullName: String,
        username: String,
        password: String,
        repeatedPassword: String,
        email: String
    ) {
        if fullName.isEmpty || username.isEmpty ||
            password.isEmpty || repeatedPassword.isEmpty || email.isEmpty {
            view?.showErrorAlert(message: .someEmptyFieldsExist)
            return
        }
        if password != repeatedPassword {
            view?.showErrorAlert(message: .passwordsNotEqual)
            return
        }
        signUpEntity = SignUpEntity(
            fullName: fullName,
            username: username,
            password: password,
            email: email
        )
    }
}

// MARK: - (Interactor -> Presenter)
extension ClientSignUpPresenter: InteractorToPresenterClientSignUpProtocol {
    
}
