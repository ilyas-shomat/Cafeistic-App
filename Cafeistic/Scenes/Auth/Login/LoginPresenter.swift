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
    
    func load() {
        
    }
    
    func handleSignInTap() {
        router?.showMenu(on: view!)
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
    
}


// MARK: - (Interactor -> Presenter)
extension LoginPresenter: InteractorToPresenterLoginProtocol {
    
}
