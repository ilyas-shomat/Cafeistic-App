//
//  ApiResult.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation

enum ApiResult<A> {
    case success(A)
    case error(NetworkError)
    
    init(_ value: A?, or error: NetworkError) {
        if let value = value {
            self = .success(value)
        }
        else {
            self = .error(error)
        }
    }
}
