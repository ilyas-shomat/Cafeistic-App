//
//  StorageProtocol.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation

protocol StorageProtocol {
    func integer(for key: String) -> Int
    func bool(for key: String) -> Bool
    func object<T: Codable>(type: T.Type, for key: String) -> T?
    func object<T>(type: T.Type, for key: String) -> T?
    func set(_ value: Bool, for key: String)
    func set(_ value: Int, for key: String)
    func set<T: Codable>(_ value: T?, for key: String)
    func set<T>(_ value: T?, for key: String)
}
