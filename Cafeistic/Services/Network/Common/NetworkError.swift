//
//  NetworkError.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 10.06.2021.
//

import Foundation

enum NetworkError: Error {
    case apiEndPointNotFound
    case serverError(reason: String)
    case unknowedError
    case netwotkFail
    case notAuthorized
    
    var message: String {
        switch self {
        case .apiEndPointNotFound:
            return StringConstant.Services.ErrorMessage.notFount
        case .serverError(let reason):
            return reason
        case .unknowedError:
            return StringConstant.Services.ErrorMessage.unknowedError
        case .netwotkFail:
            return StringConstant.Services.ErrorMessage.networkFail
        case .notAuthorized:
            return StringConstant.Services.ErrorMessage.notAuthorized
        }
    }
}
