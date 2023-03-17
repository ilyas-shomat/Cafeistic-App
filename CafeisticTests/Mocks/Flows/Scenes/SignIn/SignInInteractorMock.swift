//
//  SignInInteractorMock.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 07.02.2023.
//

import Foundation
@testable import Cafeistic

final class SignInInteractorMock: SingInInteractorDelegate {
    var scene: SignInSceneDelegate?
    
    var isAuthorizeCalled = false
    
    func authorize(entity: SignInEntity) {
        isAuthorizeCalled = true
    }
}
