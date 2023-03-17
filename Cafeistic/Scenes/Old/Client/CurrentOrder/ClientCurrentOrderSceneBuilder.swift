//
//  ClientCurrentOrderSceneBuilder.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 24.05.2021.
//  
//

import UIKit

class ClientCurrentOrderScene {
    
    static func initiate() -> UIViewController {
        let viewController = ClientCurrentOrderViewController()
        
        let presenter: ViewToPresenterClientCurrentOrderProtocol & InteractorToPresenterClientCurrentOrderProtocol = ClientCurrentOrderPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ClientCurrentOrderRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ClientCurrentOrderInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
