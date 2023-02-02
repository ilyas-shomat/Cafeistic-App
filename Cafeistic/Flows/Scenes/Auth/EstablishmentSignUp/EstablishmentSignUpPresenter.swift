//
//  EstablishmentSignUpPresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class EstablishmentSignUpPresenter: ViewToPresenterEstablishmentSignUpProtocol {

    var view: PresenterToViewEstablishmentSignUpProtocol?
    var interactor: PresenterToInteractorEstablishmentSignUpProtocol?
    var router: PresenterToRouterEstablishmentSignUpProtocol?
    
    func load() {
        
    }
}

// MARK: - (Interactor -> Presenter)
extension EstablishmentSignUpPresenter: InteractorToPresenterEstablishmentSignUpProtocol {
    
}
