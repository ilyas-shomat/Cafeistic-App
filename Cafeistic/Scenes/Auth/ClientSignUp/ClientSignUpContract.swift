//
//  ClientSignUpContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewClientSignUpProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterClientSignUpProtocol {
    
    var view: PresenterToViewClientSignUpProtocol? { get set }
    var interactor: PresenterToInteractorClientSignUpProtocol? { get set }
    var router: PresenterToRouterClientSignUpProtocol? { get set }
    
    func load()
    func handleSignUpTap()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorClientSignUpProtocol {
    
    var presenter: InteractorToPresenterClientSignUpProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterClientSignUpProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterClientSignUpProtocol {
    
}
