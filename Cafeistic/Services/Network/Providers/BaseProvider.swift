//
//  BaseProvider.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation
import Moya

protocol BaseApiDelegate: TargetType {}

extension BaseApiDelegate {
    var baseURL: URL {
        #if DEBUG
        guard let url = URL(string: "http://127.0.0.1:8000") else {
            fatalError()
        }
        return url
        #else
        guard let url = URL(string: "") else {
            fatalError()
        }
        return url
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
