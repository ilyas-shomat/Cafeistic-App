//
//  KeyChainStorage.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation
import KeychainAccess

protocol KeyChainStorage {
    func set(_ value: String, for Key: KeychainKey)
    func get(for key: KeychainKey) -> String?
    func remove(for key: KeychainKey)
    func clear()
}

struct KeyChainStorageImpl: KeyChainStorage {
    
    private let keychain = Keychain(service: KeychainKey.domain.rawValue)
    
    func set(_ value: String, for key: KeychainKey) {
        keychain[key.rawValue] = value
    }
    
    func get(for key: KeychainKey) -> String? {
        return keychain[key.rawValue]
    }
    
    func remove(for key: KeychainKey) {
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


