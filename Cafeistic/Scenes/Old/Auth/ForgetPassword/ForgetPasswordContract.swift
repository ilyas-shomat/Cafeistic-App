//
//  ForgetPasswordContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 29.04.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewForgetPasswordProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterForgetPasswordProtocol {
    
    var view: PresenterToViewForgetPasswordProtocol? { get set }
    var interactor: PresenterToInteractorForgetPasswordProtocol? { get set }
    var router: PresenterToRouterForgetPasswordProtocol? { get set }
    
    func load()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorForgetPasswordProtocol {
    
    var presenter: InteractorToPresenterForgetPasswordProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterForgetPasswordProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterForgetPasswordProtocol {
    
}
