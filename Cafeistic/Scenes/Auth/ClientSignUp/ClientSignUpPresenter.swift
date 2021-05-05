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
    
    func handleSignUpTap() {
        
    }
}

// MARK: - (Interactor -> Presenter)
extension ClientSignUpPresenter: InteractorToPresenterClientSignUpProtocol {
    
}
