//
//  ApiConstants.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation

struct ApiConstants {
    
    static let releaseUrl = URL(string: "")!
    static let debugUrl = URL(string: "http://127.0.0.1:8000")!
    
    struct EndPoints {
        
        struct Auth {
            static let login: String = "/account/login"
        }
    }
}
