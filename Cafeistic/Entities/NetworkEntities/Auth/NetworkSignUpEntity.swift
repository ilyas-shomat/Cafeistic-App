//
//  UserNetworkSignUp.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 03.11.2021.
//

import Foundation

struct SignUpEntityRequest: Codable {
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

struct SignUpEntityResponse: ApiResponseData, Codable {
    var status: String?
    var desc: String?
    var data: SignUpDataEntityResponse?
    var errorMessage: [String]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case desc
        case data
        case errorMessage = "username"
    }
}

struct SignUpDataEntityResponse: Codable {
    var fullName: String
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case token
    }
}
