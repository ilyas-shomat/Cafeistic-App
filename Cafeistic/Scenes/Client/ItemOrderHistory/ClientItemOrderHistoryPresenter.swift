//
//  ClientItemOrderHistoryPresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.05.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class ClientItemOrderHistoryPresenter: ViewToPresenterClientItemOrderHistoryProtocol {

    var view: PresenterToViewClientItemOrderHistoryProtocol?
    var interactor: PresenterToInteractorClientItemOrderHistoryProtocol?
    var router: PresenterToRouterClientItemOrderHistoryProtocol?
    
    func load() {
        
    }
}

// MARK: - (Interactor -> Presenter)
extension ClientItemOrderHistoryPresenter: InteractorToPresenterClientItemOrderHistoryProtocol {
    
}
