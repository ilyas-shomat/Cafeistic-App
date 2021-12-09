//
//  AuthTarget.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation
import Moya

enum AuthTarget {
    case login(loginEntityRequest: LoginEntityRequest)
    case clientSignUp(signUpEntityRequest: SignUpEntityRequest)
}

extension AuthTarget: BaseApiProvider, AnyTargetConvertible {
    var path: String {
        switch self {
        case .login:
            return ApiConstants.EndPoints.Auth.login
        case .clientSignUp:
            return ApiConstants.EndPoints.Auth.userSignUp
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .clientSignUp:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .login(let loginEntityRequest):
            return .requestJSONEncodable(loginEntityRequest)
        case .clientSignUp(let signUpEntityRequest):
            return .requestJSONEncodable(signUpEntityRequest)
        }
    }
}
