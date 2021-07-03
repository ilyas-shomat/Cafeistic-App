//
//  FakeNetworkApiService.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 03.07.2021.
//

import Foundation
@testable import Cafeistic

final class MockNetworkApiService: Networkable {
       
    private(set) var isCalledLoad = false
    
    init() {
    }
    
    func load<T: Codable>(target: AnyTargetConvertible, jsonType: T.Type, onComplete: @escaping (ApiResponse<T>) -> ()) {
        isCalledLoad = true
        onComplete(.success(T.self as? T))
    }
}
