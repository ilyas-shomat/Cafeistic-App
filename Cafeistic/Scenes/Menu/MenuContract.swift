//
//  MenuContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 04.05.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewMenuProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterMenuProtocol {
    
    var view: PresenterToViewMenuProtocol? { get set }
    var interactor: PresenterToInteractorMenuProtocol? { get set }
    var router: PresenterToRouterMenuProtocol? { get set }
    
    func load()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorMenuProtocol {
    
    var presenter: InteractorToPresenterMenuProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterMenuProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterMenuProtocol {
    
}
