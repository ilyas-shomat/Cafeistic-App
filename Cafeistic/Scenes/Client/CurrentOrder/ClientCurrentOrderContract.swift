//
//  ClientCurrentOrderContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 24.05.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewClientCurrentOrderProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterClientCurrentOrderProtocol {
    
    var view: PresenterToViewClientCurrentOrderProtocol? { get set }
    var interactor: PresenterToInteractorClientCurrentOrderProtocol? { get set }
    var router: PresenterToRouterClientCurrentOrderProtocol? { get set }
    
    func load()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorClientCurrentOrderProtocol {
    
    var presenter: InteractorToPresenterClientCurrentOrderProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterClientCurrentOrderProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterClientCurrentOrderProtocol {
    
}
