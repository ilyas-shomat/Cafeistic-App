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
    var error: String?
    
    enum CodingKeys: String, CodingKey {
        case token
        case error = "non_field_errors"
    }
}
