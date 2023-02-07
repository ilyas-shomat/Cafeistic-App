//
//  SignInInteractor.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 02.02.2023.
//

import Foundation
import Combine
import LiteNet

final class SignInInteractor: SingInInteractorDelegate {
    var scene: SignInSceneDelegate?
    
    private let networkService: LiteNetProtocol
    private var cancellables: Set<AnyCancellable>
    
    init(
        networkService: LiteNetProtocol,
        cancellables: Set<AnyCancellable>
    ) {
        self.networkService = networkService
        self.cancellables = cancellables
    }
    
    func sendUserData(entity: SignInEntity) {
        let target = AuthTarget.signIn(loginEntityRequest: entity.getServiceEntity())
        
        networkService.loadSubject(
            target: target,
            jsonType: SignInResponseEntity.self
        )
        .sink(
            receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("failure", error)
                }
            },
            receiveValue: { result in
                if let token = result.token {
                    print("token", token)
                }
            }
        )
        .store(in: &cancellables)
    }
}
