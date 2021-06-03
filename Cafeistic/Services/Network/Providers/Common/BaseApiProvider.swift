//
//  BaseProvider.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation
import Moya

protocol BaseApiProvider: TargetType {}

extension BaseApiProvider {
    var baseURL: URL {
        #if DEBUG
        return ApiConstants.debugUrl
        #else
        return ApiConstants.releaseUrl
        #endif
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        var token = ""
//        if UserDefaults.standard.string(forKey: "new_userTokenKey") != nil {
//            token = UserDefaults.standard.string(forKey: "new_userTokenKey") as! String
//        }
//        if token != nil {
//            return [
//                "Content-type": "application/json; charset=UTF-8",
//                "Authorization": " Token \(token)"
//            ]
//        }
//        else {
//            return [
//                "Content-type": "application/json; charset=UTF-8",
//            ]
//        }
        return [
            "Content-type": "application/json; charset=UTF-8",
        ]
    }
}
