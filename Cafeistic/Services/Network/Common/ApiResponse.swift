//
//  ApiResponse.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 10.06.2021.
//

import Foundation

protocol ApiResponseData {
    var status: String? { get }
    var desc: String? { get }
}

enum ApiResponse<Value> {
    case success(Value?)
    case failure(NetworkError?)
}
