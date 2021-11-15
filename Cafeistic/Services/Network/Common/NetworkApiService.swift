//
//  WebApiService.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation
import Moya

protocol Networkable {
    func load<T: Codable>(target: AnyTargetConvertible, jsonType: T.Type, onComplete: @escaping (ApiResponse<T>) -> ())
}

final class NetworkApiService: Networkable {
    
    private let provider: MoyaProvider<AnyTarget>
    
    init(provider: MoyaProvider<AnyTarget>) {
        self.provider = provider
    }
    
    func load<T: Codable>(target: AnyTargetConvertible, jsonType: T.Type, onComplete: @escaping (ApiResponse<T>) -> ()) {
        provider.request(target.any) { (result) in
            switch result {
            case .success(let response):
                switch response.statusCode {
                case 200, 201:
                    do {
                        let data = try JSONDecoder().decode(T.self, from: response.data)
                        onComplete(.success(data))
                    }
                    catch {
                        onComplete(.failure(.notDecodable))
                    }
                case 401:
                    onComplete(.failure(.notAuthorized))
                case 404:
                    onComplete(.failure(.apiEndPointNotFound))
                default:
                    onComplete(.failure(.unknowedError))
                }
            case .failure:
                onComplete(.failure(.netwotkFail))
            }
        }
    }
}
