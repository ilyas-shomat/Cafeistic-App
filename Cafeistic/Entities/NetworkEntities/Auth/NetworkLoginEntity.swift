//
//  LoginNetworkEntity.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation

struct LoginEntityRequest: Codable {
    var username: String
    var password: String
}

struct LoginEntityResponse: Codable {
    var token: String?
}
