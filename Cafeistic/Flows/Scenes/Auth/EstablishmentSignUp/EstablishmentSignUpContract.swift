//
//  EstablishmentSignUpContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewEstablishmentSignUpProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterEstablishmentSignUpProtocol {
    
    var view: PresenterToViewEstablishmentSignUpProtocol? { get set }
    var interactor: PresenterToInteractorEstablishmentSignUpProtocol? { get set }
    var router: PresenterToRouterEstablishmentSignUpProtocol? { get set }
    
    func load()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorEstablishmentSignUpProtocol {
    
    var presenter: InteractorToPresenterEstablishmentSignUpProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterEstablishmentSignUpProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterEstablishmentSignUpProtocol {
    
}
