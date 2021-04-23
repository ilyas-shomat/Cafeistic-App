//
//  StartRouter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//  
//

import Foundation
import UIKit

// MARK: - (Presenter -> Router)
class StartRouter: PresenterToRouterStartProtocol {
    
    static func initiateScene() -> UIViewController {
        let viewController = StartViewController()
        
        let presenter: ViewToPresenterStartProtocol & InteractorToPresenterStartProtocol = StartPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = StartRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = StartInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
