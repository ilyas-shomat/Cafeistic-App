//
//  ClientCurrentOrderPresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 24.05.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class ClientCurrentOrderPresenter: ViewToPresenterClientCurrentOrderProtocol {

    var view: PresenterToViewClientCurrentOrderProtocol?
    var interactor: PresenterToInteractorClientCurrentOrderProtocol?
    var router: PresenterToRouterClientCurrentOrderProtocol?
    
    func load() {
        
    }
}

// MARK: - (Interactor -> Presenter)
extension ClientCurrentOrderPresenter: InteractorToPresenterClientCurrentOrderProtocol {
    
}
