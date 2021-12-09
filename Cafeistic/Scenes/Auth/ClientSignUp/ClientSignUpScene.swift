//
//  ClientSignUpScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import UIKit

class ClientSignUpScene {

    static var instance: UIViewController {
        let viewController = ClientSignUpViewController()
        
        let presenter: ViewToPresenterClientSignUpProtocol & InteractorToPresenterClientSignUpProtocol = ClientSignUpPresenter()
        
        let networkApiSerive = serloc.getService(Networkable.self)

        
        viewController.presenter = presenter
        viewController.presenter?.router = ClientSignUpRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ClientSignUpInteractor(networkApiService: networkApiSerive)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
