//
//  LoginRouter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//  
//

import Foundation
import UIKit

// MARK: - (Presenter -> Router)
class LoginRouter: PresenterToRouterLoginProtocol {
    
    func showForgetPasswordScene(on view: PresenterToViewLoginProtocol) {
        let viewController = view as? LoginViewController
        viewController?.navigationController?.pushViewController(ForgetPasswordScene.initiate(), animated: true)
    }
    
    func showClientSignUp(on view: PresenterToViewLoginProtocol) {
        let viewController = view as? LoginViewController
        viewController?.navigationController?.pushViewController(ClientSignUpScene.initiate(), animated: true)
    }
    
    func showEstablishmentSignUp(on view: PresenterToViewLoginProtocol) {
        let viewController = view as? LoginViewController
        viewController?.navigationController?.pushViewController(EstablishmentSignUpScene.initiate(), animated: true)
    }
    
    //MARK: - Temp Code
    func showMenu(on view: PresenterToViewLoginProtocol) {
        let viewController = view as? LoginViewController
        let showingTabBarController = MainTabBarController(type: .client)
        showingTabBarController.modalPresentationStyle = .overFullScreen
        viewController?.navigationController?.present(showingTabBarController, animated: true, completion: nil)
    }
}
