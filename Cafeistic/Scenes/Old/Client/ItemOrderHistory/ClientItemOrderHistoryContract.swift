//
//  ClientItemOrderHistoryContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.05.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewClientItemOrderHistoryProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterClientItemOrderHistoryProtocol {
    
    var view: PresenterToViewClientItemOrderHistoryProtocol? { get set }
    var interactor: PresenterToInteractorClientItemOrderHistoryProtocol? { get set }
    var router: PresenterToRouterClientItemOrderHistoryProtocol? { get set }
    
    func load()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorClientItemOrderHistoryProtocol {
    
    var presenter: InteractorToPresenterClientItemOrderHistoryProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterClientItemOrderHistoryProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterClientItemOrderHistoryProtocol {
}
