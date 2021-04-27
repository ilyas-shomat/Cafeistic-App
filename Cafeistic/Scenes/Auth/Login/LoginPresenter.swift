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
}

// MARK: - (Interactor -> Presenter)
extension LoginPresenter: InteractorToPresenterLoginProtocol {
    
}
