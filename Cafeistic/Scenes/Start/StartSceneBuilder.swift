//
//  StartSceneBuilder.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//

import Foundation
import UIKit

class StartScene {
    static func initiate() -> UIViewController {
        let viewController = StartViewController()
        let presenter: ViewToPresenterStartProtocol & InteractorToPresenterStartProtocol = StartPresenter()
        
        let sessionTracker = AppInitializer.serloc.getService(SessionTracker.self)
        
        viewController.presenter = presenter
        viewController.presenter?.router = StartRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = StartInteractor(sessionTracker: sessionTracker)
        viewController.presenter?.interactor?.presenter = presenter
                
        return viewController
    }
}
