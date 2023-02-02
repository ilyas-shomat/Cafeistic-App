//
//  ClientOrderHistorySceneBuilder.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.05.2021.
//  
//

import UIKit

class ClientOrderHistoryScene {
    
    static func initiate() -> UIViewController {
        let viewController = ClientOrderHistoryViewController()
        
        let presenter: ViewToPresenterClientOrderHistoryProtocol & InteractorToPresenterClientOrderHistoryProtocol = ClientOrderHistoryPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ClientOrderHistoryRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ClientOrderHistoryInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
