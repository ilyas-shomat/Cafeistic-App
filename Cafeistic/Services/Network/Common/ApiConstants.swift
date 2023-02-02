//
//  ApiConstants.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation

struct ApiConstants {
    static let releaseUrl: String = ""
    static let debugUrl: String = "https://cafeistic.herokuapp.com/api/v1"
    
    struct EndPoints {
        
        struct Auth {
            static let login: String = "/account/login"
            static let userSignUp: String = "/account/create_user"
        }
    }
}
