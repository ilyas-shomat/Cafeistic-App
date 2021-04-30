//
//  ForgetPasswordSceneBuilder.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 29.04.2021.
//  
//

import UIKit

class ForgetPasswordScene {
    
    static func initiate() -> UIViewController {
        let viewController = ForgetPasswordViewController()
        
        let presenter: ViewToPresenterForgetPasswordProtocol & InteractorToPresenterForgetPasswordProtocol = ForgetPasswordPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ForgetPasswordRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ForgetPasswordInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
