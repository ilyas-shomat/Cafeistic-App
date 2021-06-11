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
}
