//
//  WebApiService.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation
import Combine
import Moya

protocol Networkable {
    var publisher: PassthroughSubject<Codable, NetworkError> { get }
    
    func load<T: Codable>(target: AnyTargetConvertible, jsonType: T.Type, onComplete: @escaping (ApiResponse<T>) -> ())
    func loadAsync<T: Codable>(target: AnyTargetConvertible, jsonType: T.Type)
}

final class NetworkService: Networkable {
    
    private let provider: MoyaProvider<AnyTarget>
    
    var publisher =  PassthroughSubject<Codable, NetworkError>()
    var cancellable = Set<AnyCancellable>()
    
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
                case 400:
                    onComplete(.failure(.badRequest))
                default:
                    onComplete(.failure(.unknowedError))
                }
            case .failure:
                onComplete(.failure(.netwotkFail))
            }
        }
    }
    
    func loadAsync<T: Codable>(target: AnyTargetConvertible, jsonType: T.Type) {
        provider.requestPublisher(target.any)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    if let reason = error.errorDescription {
                        self.publisher.send(completion: .failure(.serverError(reason: reason)))
                    }
                case .finished:
                    self.publisher.send(completion: .finished)
                }
            }, receiveValue: { response in
                switch response.statusCode {
                case 200, 201:
                    do {
                        let data = try JSONDecoder().decode(T.self, from: response.data)
                        self.publisher.send(data)
                    }
                    catch {
                        self.publisher.send(completion: .failure(.notDecodable))
                    }
                case 401:
                    self.publisher.send(completion: .failure(.notAuthorized))
                case 404:
                    self.publisher.send(completion: .failure(.apiEndPointNotFound))
                default:
                    self.publisher.send(completion: .failure(.unknowedError))
                }

            })
            .store(in: &cancellable)
    }
}
