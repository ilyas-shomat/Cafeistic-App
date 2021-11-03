//
//  UserNetworkSignUp.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 03.11.2021.
//

import Foundation

struct UserSignUpEntityRequest: Codable {
    var fullName: String
    var username: String
    var password: String
    var email: String
    var userType: String = "client"
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case username
        case password
        case email
        case userType = "user_type"
    }
}

