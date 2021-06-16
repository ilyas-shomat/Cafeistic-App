//
//  AlertMessageConstant.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.06.2021.
//

import Foundation

enum AlertMessageConstant {
    case usernameOrPasswordEmpty
    case defaultServerError(message: String)
    
    var title: String {
        switch self {
        case .usernameOrPasswordEmpty:
            return StringConstant.Scenes.Login.error
        case .defaultServerError:
            return StringConstant.Services.AlertMessage.error
        }
    }
    
    var message: String {
        switch self {
        case .usernameOrPasswordEmpty:
            return StringConstant.Scenes.Login.message
        case .defaultServerError(let message):
            return message
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .usernameOrPasswordEmpty:
            return StringConstant.Scenes.Login.ok
        case .defaultServerError:
            return StringConstant.Services.AlertMessage.ok
        }
    }
}
