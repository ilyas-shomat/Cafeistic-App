//
//  ClientOrderHistoryRouter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.05.2021.
//  
//

import Foundation
import UIKit

// MARK: - (Presenter -> Router)
class ClientOrderHistoryRouter: PresenterToRouterClientOrderHistoryProtocol {
    func showClientItemOrderHistory(on view: PresenterToViewClientOrderHistoryProtocol) {
        let viewController = view as? ClientOrderHistoryViewController
        viewController?.navigationController?.pushViewController(ClientItemOrderHistoryScene.initiate(), animated: true)
    }
    
}
