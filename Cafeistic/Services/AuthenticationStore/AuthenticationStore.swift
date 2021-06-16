//
//  AuthenticationStore.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation

struct AuthenticationStore {
    
    static let shared = AuthenticationStore()
    
    private let storage = KeyChainStorageImpl()
    
    private init() {
        
    }
    
    func store(token: String) {
        storage.set(token, for: .token)
    }
    
    func getToken() -> String? {
        return storage.get(for: .token)
    }
    
    func removeToken() {
        storage.remove(for: .token)
    }
    
    func clear() {
        storage.clear()
    }
}
