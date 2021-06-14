//
//  StorageProtocol.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation

protocol StorageProtocol {
    func integer(for key: StorageKey) -> Int
    func bool(for key: StorageKey) -> Bool
    func string(for key: StorageKey) -> String
    func object<T: Codable>(type: T.Type, for key: StorageKey) -> T?
    func object<T>(type: T.Type, for key: StorageKey) -> T?
    func set(_ value: Bool, for key: StorageKey)
    func set(_ value: Int, for key: StorageKey)
    func set(_ value: String, for key: StorageKey)
    func set<T: Codable>(_ value: T?, for key: StorageKey)
    func set<T>(_ value: T?, for key: StorageKey)
}
