//
//  StartProtocols.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewStartProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterStartProtocol {
    
    var view: PresenterToViewStartProtocol? { get set }
    var interactor: PresenterToInteractorStartProtocol? { get set }
    var router: PresenterToRouterStartProtocol? { get set }
    
    func load()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorStartProtocol {
    
    var presenter: InteractorToPresenterStartProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterStartProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterStartProtocol {
    func showLoginScene(on view: PresenterToViewStartProtocol)
    func showClientMainTab(on view: PresenterToViewStartProtocol)
}
