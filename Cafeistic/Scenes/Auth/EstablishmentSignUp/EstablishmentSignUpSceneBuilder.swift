//
//  EstablishmentSignUpSceneBuilder.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import UIKit

class EstablishmentSignUpScene {
    
    static func initiate() -> UIViewController {
        let viewController = EstablishmentSignUpViewController()
        
        let presenter: ViewToPresenterEstablishmentSignUpProtocol & InteractorToPresenterEstablishmentSignUpProtocol = EstablishmentSignUpPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = EstablishmentSignUpRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = EstablishmentSignUpInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
