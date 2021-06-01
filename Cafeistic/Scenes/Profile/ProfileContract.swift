//
//  ProfileContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.05.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewProfileProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterProfileProtocol {
    
    var view: PresenterToViewProfileProtocol? { get set }
    var interactor: PresenterToInteractorProfileProtocol? { get set }
    var router: PresenterToRouterProfileProtocol? { get set }
    
    func load()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorProfileProtocol {
    
    var presenter: InteractorToPresenterProfileProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterProfileProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterProfileProtocol {
    
}
