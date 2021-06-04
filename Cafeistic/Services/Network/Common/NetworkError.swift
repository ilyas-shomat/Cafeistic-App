//
//  NetworkError.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation

enum NetworkError: Error {
    case incorrectJSON
    case networkFail
    case serverError(reason: String)
    case unknownServerError
    case unauthorized
    case wrongCredentials
}
