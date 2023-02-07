//
//  NetworkServiceMock.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 07.02.2023.
//

import Foundation
import LiteNet
import Combine

final class NetworkServiceMock: LiteNetProtocol {
    var isError: Bool = false
    var responseEntity: Codable?
    
    func load(target: AnyTargetConvertible, onComplete: @escaping JsonEmptyCompletion) {
        onComplete(.success(nil))
    }
    
    func load<T>(target: AnyTargetConvertible, jsonType: T.Type, onComplete: @escaping JsonCompletion<T>) where T : Decodable, T : Encodable {
        onComplete(.success(nil))
    }
    
    func load<T, E>(target: AnyTargetConvertible, jsonType: T.Type, errorType: E.Type, onComplete: @escaping JsonCodableErrorCompletion<T, E>) where T : Decodable, T : Encodable, E : Decodable, E : Encodable {
        
    }
    
    func loadSubject(target: AnyTargetConvertible) -> PassthroughSubject<Codable, ServiceError> {
        .init()
    }
    
    func loadSubject<T>(target: AnyTargetConvertible, jsonType: T.Type) -> PassthroughSubject<T, ServiceError> where T : Decodable, T : Encodable {
        let subject = PassthroughSubject<T, ServiceError>()
        
        if isError {
            DispatchQueue.main.async {
                subject.send(completion: .failure(.unknown))
            }
        }
        else {
            DispatchQueue.main.async { [weak self] in
                subject.send(self?.responseEntity as! T)
            }
        }
            
        return subject
    }
    
    func loadSubject<T, E>(target: AnyTargetConvertible, jsonType: T.Type, errorJsonType: E.Type) -> PassthroughSubject<T, E> where T : Decodable, T : Encodable, E : Decodable, E : Encodable, E : Error {
        .init()
    }
}
