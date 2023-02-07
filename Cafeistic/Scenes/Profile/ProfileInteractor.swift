//
//  ProfileInteractor.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.05.2021.
//  
//

import Foundation
//import Light
import LiteNet

// MARK: - (Presenter -> Interactor)
class ProfileInteractor: PresenterToInteractorProfileProtocol {

    var presenter: InteractorToPresenterProfileProtocol?
    var networkApiService: LiteNetProtocol
    var sessionTracker: SessionTracker
    
    init(networkApiService: LiteNetProtocol, sessionTracker: SessionTracker) {
        self.networkApiService = networkApiService
        self.sessionTracker = sessionTracker
    }
    
    func logout() {
        sessionTracker.logout()
    }
}
