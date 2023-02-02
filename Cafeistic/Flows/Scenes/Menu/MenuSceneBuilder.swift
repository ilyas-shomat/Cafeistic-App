//
//  MenuSceneBuilder.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 04.05.2021.
//  
//

import UIKit

class MenuScene {
    
    static func initiate() -> UIViewController {
        let viewController = MenuViewController()
        
        let presenter: ViewToPresenterMenuProtocol & InteractorToPresenterMenuProtocol = MenuPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MenuRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MenuInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
