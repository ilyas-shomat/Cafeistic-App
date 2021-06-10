//
//  LoginEntity.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation

// Request Params
struct LoginEntityIn: Codable {
    
    var username: String?
    var password: String?
}

// Response Params
struct LoginEntityOut: Codable {
    
    var token: String?
}
