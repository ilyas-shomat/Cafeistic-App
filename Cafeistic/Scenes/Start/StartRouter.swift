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
    
    func showLoginScene(on view: PresenterToViewStartProtocol) {
        let viewController = view as? StartViewController
        let navigationController = viewController?.navigationController
        
        navigationController?.setViewControllers([LoginScene.initiate()], animated: false)
    }
    
}
