//
//  UserDefaultsStorage.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation

protocol UserDefaultsStorageProtocol {
    func integer(for key: UserDefaultsKey) -> Int
    func bool(for key: UserDefaultsKey) -> Bool
    func string(for key: UserDefaultsKey) -> String
    func object<T: Codable>(type: T.Type, for key: UserDefaultsKey) -> T?
    func object<T>(type: T.Type, for key: UserDefaultsKey) -> T?
    func set(_ value: Bool, for key: UserDefaultsKey)
    func set(_ value: Int, for key: UserDefaultsKey)
    func set(_ value: String, for key: UserDefaultsKey)
    func set<T: Codable>(_ value: T?, for key: UserDefaultsKey)
    func set<T>(_ value: T?, for key: UserDefaultsKey)
}

struct UserDefaultsStorage: UserDefaultsStorageProtocol {
    private let userDefaults = UserDefaults.standard
    
    func integer(for key: UserDefaultsKey) -> Int {
        return userDefaults.integer(forKey: key.rawValue)
    }
    
    func bool(for key: UserDefaultsKey) -> Bool {
        return userDefaults.bool(forKey: key.rawValue)
    }
    
    func string(for key: UserDefaultsKey) -> String {
        guard let string = userDefaults.string(forKey: key.rawValue) else {
            return  ""
        }
        return string
    }
    
    func object<T>(type: T.Type, for key: UserDefaultsKey) -> T? where T : Decodable, T : Encodable {
        guard let data = userDefaults.data(forKey: key.rawValue) else {
            return nil
        }
        let decodedData = try? JSONDecoder().decode(type, from: data)
        return decodedData
    }
    
    func object<T>(type: T.Type, for key: UserDefaultsKey) -> T? {
        guard let data = userDefaults.data(forKey: key.rawValue) as? T else {
            return nil
        }
        return data
    }
    
    func set(_ value: Bool, for key: UserDefaultsKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
    
    func set(_ value: Int, for key: UserDefaultsKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
    
    func set(_ value: String, for key: UserDefaultsKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
    
    func set<T>(_ value: T?, for key: UserDefaultsKey) where T : Decodable, T : Encodable {
        do {
            let encodedData = try JSONEncoder().encode(value)
            userDefaults.setValue(encodedData, forKey: key.rawValue)
        }
        catch let error {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func set<T>(_ value: T?, for key: UserDefaultsKey) {
        userDefaults.setValue(value, forKey: key.rawValue)
    }
}

