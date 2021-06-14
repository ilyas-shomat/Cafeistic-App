//
//  UserDefaultsStorage.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation

struct UserDefaultsStorage: StorageProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    func integer(for key: StorageKey) -> Int {
        return userDefaults.integer(forKey: key.rawValue)
    }
    
    func bool(for key: StorageKey) -> Bool {
        return userDefaults.bool(forKey: key.rawValue)
    }
    
    func string(for key: StorageKey) -> String {
        guard let string = userDefaults.string(forKey: key.rawValue) else {
            return  ""
        }
        return string
    }
    
    func object<T>(type: T.Type, for key: StorageKey) -> T? where T : Decodable, T : Encodable {
        guard let data = userDefaults.data(forKey: key.rawValue) else {
            return nil
        }
        let decodedData = try? JSONDecoder().decode(type, from: data)
        return decodedData
    }
    
    func object<T>(type: T.Type, for key: StorageKey) -> T? {
        guard let data = userDefaults.data(forKey: key.rawValue) as? T else {
            return nil
        }
        return data
    }
    
    func set(_ value: Bool, for key: StorageKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
    
    func set(_ value: Int, for key: StorageKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
    
    func set(_ value: String, for key: StorageKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
    
    func set<T>(_ value: T?, for key: StorageKey) where T : Decodable, T : Encodable {
        do {
            let encodedData = try JSONEncoder().encode(value)
            userDefaults.setValue(encodedData, forKey: key.rawValue)
        }
        catch let error {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func set<T>(_ value: T?, for key: StorageKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
}
