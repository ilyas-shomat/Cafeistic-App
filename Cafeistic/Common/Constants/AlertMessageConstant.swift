//
//  AlertMessageConstant.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.06.2021.
//

import Foundation

enum AlertMessageConstant {
    case usernameOrPasswordEmpty
    
    var title: String {
        switch self {
        case .usernameOrPasswordEmpty:
            return StringConstant.Scenes.Login.error
        }
    }
    
    var message: String {
        switch self {
        case .usernameOrPasswordEmpty:
            return StringConstant.Scenes.Login.message
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .usernameOrPasswordEmpty:
            return StringConstant.Scenes.Login.ok
        }
    }
}
