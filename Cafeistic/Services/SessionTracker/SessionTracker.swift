//
//  SessionTracker.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation
//import Light
import LiteNet

protocol SessionTrackerProtocol: AnyObject {
    var isLoggedIn: Bool { get }
    var isFirstLaunch: Bool { get }
    
    func updateToken(token: String)
    func logout()
}

final class SessionTracker {
    private let storage: UserDefaultsStorageProtocol
    private let networkService: LiteNetProtocol
    
    init(storage: UserDefaultsStorageProtocol, networkService: LiteNetProtocol) {
        self.storage = storage
        self.networkService = networkService
    }
    
    private func setupObserver() {
        
    }
}
 
extension SessionTracker: SessionTrackerProtocol {
    var isLoggedIn: Bool {
        return !(AuthenticationStore.shared.getToken() == nil)
    }
    
    var isFirstLaunch: Bool {
        get {
            !storage.bool(for: .launchedBefore)
        }
        set {
            storage.set(!newValue, for: .launchedBefore)
        }
    }
    
    func updateToken(token: String) {
        AuthenticationStore.shared.store(token: token)
    }
    
    func logout() {
        AuthenticationStore.shared.removeToken()
    }
}
