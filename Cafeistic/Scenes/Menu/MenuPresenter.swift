//
//  MenuPresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 04.05.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class MenuPresenter: ViewToPresenterMenuProtocol {

    var view: PresenterToViewMenuProtocol?
    var interactor: PresenterToInteractorMenuProtocol?
    var router: PresenterToRouterMenuProtocol?
    
    func load() {
        
    }
}

// MARK: - (Interactor -> Presenter)
extension MenuPresenter: InteractorToPresenterMenuProtocol {
    
}
