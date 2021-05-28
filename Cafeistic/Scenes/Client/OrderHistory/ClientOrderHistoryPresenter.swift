//
//  ClientOrderHistoryPresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.05.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class ClientOrderHistoryPresenter: ViewToPresenterClientOrderHistoryProtocol {

    var view: PresenterToViewClientOrderHistoryProtocol?
    var interactor: PresenterToInteractorClientOrderHistoryProtocol?
    var router: PresenterToRouterClientOrderHistoryProtocol?
    
    func load() {
        
    }
    
    func openOrderHistoryItem() {
        router?.showClientItemOrderHistory(on: view!)
    }
}

// MARK: - (Interactor -> Presenter)
extension ClientOrderHistoryPresenter: InteractorToPresenterClientOrderHistoryProtocol {
    
}
