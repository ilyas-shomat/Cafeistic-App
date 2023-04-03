//
//  ClientOrderHistoryContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.05.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewClientOrderHistoryProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterClientOrderHistoryProtocol {
    
    var view: PresenterToViewClientOrderHistoryProtocol? { get set }
    var interactor: PresenterToInteractorClientOrderHistoryProtocol? { get set }
    var router: PresenterToRouterClientOrderHistoryProtocol? { get set }
    
    func load()
    func openOrderHistoryItem()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorClientOrderHistoryProtocol {
    
    var presenter: InteractorToPresenterClientOrderHistoryProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterClientOrderHistoryProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterClientOrderHistoryProtocol {
    func showClientItemOrderHistory(on view: PresenterToViewClientOrderHistoryProtocol)
}
