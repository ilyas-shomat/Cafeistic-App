//
//  WebApiService.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation
import Moya

protocol Networkable {
    func load<T: Codable>(target: AnyTargetConvertible, jsonType: T.Type, onComplete: @escaping (T?, Error?) -> ())
}

final class NetworkApiService: Networkable {
    
    private let provider: MoyaProvider<AnyTarget>
    
    init(provider: MoyaProvider<AnyTarget>) {
        self.provider = provider
    }
    
    func load<T: Codable>(target: AnyTargetConvertible, jsonType: T.Type, onComplete: @escaping (T?, Error?) -> ()) {
        provider.request(target.any) { (response) in
            print("/// response:", response)
            switch response {
            case .success(let json):
                print("/// success json:", json)
                do {
                    let data = try JSONDecoder().decode(T.self, from: json.data)
                    onComplete(data, nil)
                }
                catch {
                    onComplete(nil, error)
                }
            case .failure(let error):
                onComplete(nil, error)
            }
        }
    }
}
