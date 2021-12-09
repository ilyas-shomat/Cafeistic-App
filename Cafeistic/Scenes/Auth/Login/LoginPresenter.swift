//
//  LoginPresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class LoginPresenter: ViewToPresenterLoginProtocol {

    var view: PresenterToViewLoginProtocol?
    var interactor: PresenterToInteractorLoginProtocol?
    var router: PresenterToRouterLoginProtocol?
    
    var loginEntity: LoginEntity?
    
    func load() {}
    
    func handleSignInTap(username: String, password: String) {
        checkEnteringUserData(username: username, password: password)
        guard let loginEntity = loginEntity else {
            return
        }
        interactor?.loginWithData(loginEntity: loginEntity)
    }
    
    func handleForgetPasswordTap() {
        router?.showForgetPasswordScene(on: view!)
    }
    
    func handleSignUpTap() {
        
    }
    
    func handleAlertTopButtonTap() {
        router?.showClientSignUp(on: view!)
    }
    
    func handleAlertBottomButtonTap() {
        router?.showEstablishmentSignUp(on: view!)
    }
    
    private func checkEnteringUserData(username: String, password: String) {
        if username.isEmpty || password.isEmpty {
            view?.showErrorAlert(message: .someEmptyFieldsExist)
        }
        else {
            loginEntity = LoginEntity(username: username, password: password)
        }
    }
}

// MARK: - (Interactor -> Presenter)
extension LoginPresenter: InteractorToPresenterLoginProtocol {
    func successAuthorized() {
        router?.showMenu(on: view!)
    }
    
    func errorAuthorized(error: String) {
        view?.showErrorAlert(message: .defaultApiError(message: error))
    }
}
