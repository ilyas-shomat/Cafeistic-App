//
//  ProfileInteractor.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.05.2021.
//  
//

import Foundation

// MARK: - (Presenter -> Interactor)
class ProfileInteractor: PresenterToInteractorProfileProtocol {

    var presenter: InteractorToPresenterProfileProtocol?
    var networkApiService: Networkable
    var sessionTracker: SessionTracker
    
    init(networkApiService: Networkable, sessionTracker: SessionTracker) {
        self.networkApiService = networkApiService
        self.sessionTracker = sessionTracker
    }
    
    func logout() {
        sessionTracker.logout()
    }
}
