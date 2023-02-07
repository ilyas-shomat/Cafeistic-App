//
//  ForgetPasswordPresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 29.04.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class ForgetPasswordPresenter: ViewToPresenterForgetPasswordProtocol {

    var view: PresenterToViewForgetPasswordProtocol?
    var interactor: PresenterToInteractorForgetPasswordProtocol?
    var router: PresenterToRouterForgetPasswordProtocol?
    
    func load() {
        
    }
}

// MARK: - (Interactor -> Presenter)
extension ForgetPasswordPresenter: InteractorToPresenterForgetPasswordProtocol {
    
}
