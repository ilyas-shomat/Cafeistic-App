//
//  StartInteractor.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//  
//

import Foundation

// MARK: - (Presenter -> Interactor)
class StartInteractor: PresenterToInteractorStartProtocol {

    var presenter: InteractorToPresenterStartProtocol?
    var sessionTracker: SessionTracker
        
    init(sessionTracker: SessionTracker) {
        self.sessionTracker = sessionTracker
    }
    
    func checkUserSession() {
        if sessionTracker.isLoggedIn {
            presenter?.userAuthorizedBefore()
        }
        else {
            presenter?.userLoginFirstTime()
        }
    }
}
