//
//  SessionTrackerImpl.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation

final class SessionTrackerImpl {
    
    private let storage: StorageProtocol
    private let netwotkApiService: Networkable
    
    init(storage: StorageProtocol, netwotkApiService: Networkable) {
        self.storage = storage
        self.netwotkApiService = netwotkApiService
    }
    
    private func setupObserver() {
        
    }
}
 
extension SessionTrackerImpl: SessionTracker {
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
        
    }
    
    func logout() {
        AuthenticationStore.shared.removeToken()
        // here you may navigate to root ViewController
    }
    
    
}
