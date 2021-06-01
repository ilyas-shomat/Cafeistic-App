//
//  LoginEntity.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation

struct LoginEntity: Codable {
    
    // Request Params
    var username: String?
    var password: String?
    
    // Response Params
    var token: String?
}
