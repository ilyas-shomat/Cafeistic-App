//
//  ClientItemOrderHistorySceneBuilder.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.05.2021.
//  
//

import UIKit

class ClientItemOrderHistoryScene {
    
    static func initiate() -> UIViewController {
        let viewController = ClientItemOrderHistoryViewController()
        
        let presenter: ViewToPresenterClientItemOrderHistoryProtocol & InteractorToPresenterClientItemOrderHistoryProtocol = ClientItemOrderHistoryPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ClientItemOrderHistoryRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ClientItemOrderHistoryInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
