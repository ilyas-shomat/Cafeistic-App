//
//  StartPresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class StartPresenter: ViewToPresenterStartProtocol {

    var view: PresenterToViewStartProtocol?
    var interactor: PresenterToInteractorStartProtocol?
    var router: PresenterToRouterStartProtocol?
    
    func load() {
        router?.showLoginScene(on: view!)
    }
}

// MARK: - (Interactor -> Presenter)
extension StartPresenter: InteractorToPresenterStartProtocol {
    
}
