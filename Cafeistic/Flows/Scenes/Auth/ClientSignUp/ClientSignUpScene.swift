//
//  ClientSignUpScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import UIKit
import LiteNet

class ClientSignUpScene {
    static var instance: UIViewController {
        let viewController = ClientSignUpViewController()
        
        let presenter: ViewToPresenterClientSignUpProtocol & InteractorToPresenterClientSignUpProtocol = ClientSignUpPresenter()
        
        let networkApiSerive = AppInitializer.serloc.getService(LiteNetProtocol.self)

        viewController.presenter = presenter
        viewController.presenter?.router = ClientSignUpRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ClientSignUpInteractor(networkApiService: networkApiSerive)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
