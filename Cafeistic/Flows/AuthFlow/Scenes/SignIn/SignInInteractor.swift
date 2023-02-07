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
    private var authenticationStore: AuthenticationStoreProtocol?
    
    init(
        networkService: LiteNetProtocol,
        cancellables: Set<AnyCancellable>,
        authenticationStore: AuthenticationStoreProtocol? = nil
    ) {
        self.networkService = networkService
        self.cancellables = cancellables
        self.authenticationStore = authenticationStore
    }
    
    func authorize(entity: SignInEntity) {
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
            receiveValue: { [weak self] result in
                if let token = result.token {
                    self?.saveToken(token)
                    self?.scene?.tokenLoaded()
                }
            }
        )
        .store(in: &cancellables)
    }
    
    private func saveToken(_ token: String) {
        authenticationStore?.store(token: token)
    }
}
