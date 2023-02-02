//
//  AuthTarget.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation
//import Light
import Alamofire
import LiteNet

enum AuthTarget {
    case login(loginEntityRequest: LoginEntityRequest)
    case clientSignUp(signUpEntityRequest: SignUpEntityRequest)
}

extension AuthTarget: BaseApiTarget, AnyTargetConvertible {
    var path: String {
        switch self {
        case .login:
            return ApiConstants.EndPoints.Auth.login
        case .clientSignUp:
            return ApiConstants.EndPoints.Auth.userSignUp
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .login: return .post
        case .clientSignUp: return .post
        }
    }
    
    var task: RequestTask {
        switch self {
        case .login(let loginEntityRequest):
            return .requestEncodableBody(loginEntityRequest)
        case .clientSignUp(let signUpEntityRequest):
            return .requestEncodableBody(signUpEntityRequest)
        }
    }
}

extension BaseApiTarget {
    var headers: [String : String]? {
        return [:]
    }
}
