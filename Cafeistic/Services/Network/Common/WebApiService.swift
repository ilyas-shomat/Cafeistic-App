//
//  WebApiService.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation
import Moya

protocol Networkable {
//    func load(target: AnyTargetConvertible)
}

final class NetworkService: Networkable {
    
    private let provider: MoyaProvider<AnyTarget>
    
    init(provider: MoyaProvider<AnyTarget>) {
        self.provider = provider
    }
    
    func load<T: Codable>(target: AnyTargetConvertible, onComplete: @escaping (T?, Error?) -> ()) {
        provider.request(target.any) { (response) in
            switch response {
            case .success(let json):
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
//        provider.request(target.any, callbackQueue: DispatchQueue.main, progress: nil) { result in
//            switch result {
//            case .success(let response):
//                let json  = JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
//            case .failure(let error):
//                onComplete(.error(.networkFail))
//            }
//        }
    }
}
