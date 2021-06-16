//
//  KeyChainStorage.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation
import KeychainAccess

protocol KeyChainStorage {
    func set(_ value: String, for Key: KeyChainKey)
    func get(for key: KeyChainKey) -> String?
    func remove(for key: KeyChainKey)
    func clear()
}

struct KeyChainStorageImpl: KeyChainStorage {
    
    private let keychain = Keychain(service: KeyChainKey.domain.rawValue)
    
    func set(_ value: String, for key: KeyChainKey) {
        keychain[key.rawValue] = value
    }
    
    func get(for key: KeyChainKey) -> String? {
        return keychain[key.rawValue]
    }
    
    func remove(for key: KeyChainKey) {
        keychain[key.rawValue] = nil
    }
    
    func clear() {
        do {
            try keychain.removeAll()
        }
        catch let error {
            assertionFailure("Can't clear keychain store: \(error.localizedDescription)")
        }
    }
    
}


