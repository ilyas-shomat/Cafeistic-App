//
//  AuthTarget.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation
import Moya

enum AuthTarget {
    case login(loginEntityIn: LoginEntityIn)
}

extension AuthTarget: BaseApiProvider, AnyTargetConvertible {
    
    var path: String {
        switch self {
        case .login:
            return ApiConstants.EndPoints.Auth.login
        }
    }
    
    var method: Moya.Method {
        switch self {
        case.login:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .login(let loginEntityIn):
            print("/// loginEntityIn", loginEntityIn)
            return .requestJSONEncodable(loginEntityIn)
        }
    }
}
