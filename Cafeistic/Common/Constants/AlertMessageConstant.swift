//
//  AlertMessageConstant.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.06.2021.
//

import Foundation

enum AlertMessageConstant {
    case someEmptyFieldsExist
    case passwordsNotEqual
    case defaultApiError(message: String)
    
    var title: String {
        switch self {
        case .someEmptyFieldsExist:
            return StringConstant.Services.AlertMessage.error
        case .passwordsNotEqual:
            return StringConstant.Services.AlertMessage.error
        case .defaultApiError:
            return StringConstant.Services.AlertMessage.error
        }
    }
    
    var message: String {
        switch self {
        case .someEmptyFieldsExist:
            return StringConstant.Services.AlertMessage.someEmptyFieldsExist
        case .passwordsNotEqual:
            return StringConstant.Services.AlertMessage.passwordsNotEqual
        case .defaultApiError(let message):
            return message
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .someEmptyFieldsExist:
            return StringConstant.Services.AlertMessage.ok
        case .passwordsNotEqual:
            return StringConstant.Services.AlertMessage.ok
        case .defaultApiError:
            return StringConstant.Services.AlertMessage.ok
        }
    }
}
