//
//  LoginContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewLoginProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterLoginProtocol {
    
    var view: PresenterToViewLoginProtocol? { get set }
    var interactor: PresenterToInteractorLoginProtocol? { get set }
    var router: PresenterToRouterLoginProtocol? { get set }
    
    func load()
    func handleSignInTap()
    func handleForgetPasswordTap()
    func handleSignUpTap()
    func handleAlertTopButtonTap()
    func handleAlertBottomButtonTap()
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorLoginProtocol {
    
    var presenter: InteractorToPresenterLoginProtocol? { get set }
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterLoginProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterLoginProtocol {
    func showForgetPasswordScene(on view: PresenterToViewLoginProtocol)
    func showClientSignUp(on view: PresenterToViewLoginProtocol)
    func showEstablishmentSignUp(on view: PresenterToViewLoginProtocol)
    
    //MARK: - Temp Code
    func showMenu(on view: PresenterToViewLoginProtocol)
}
