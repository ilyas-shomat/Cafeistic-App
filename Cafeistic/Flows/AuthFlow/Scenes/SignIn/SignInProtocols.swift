//
//  SignInProtocols.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 02.02.2023.
//

import Foundation

protocol SignInSceneDelegate {
    func tokenLoaded()
}

protocol SingInInteractorDelegate {
    var scene: SignInSceneDelegate? { get set }
    
    func authorize(entity: SignInEntity)
}

protocol SignInCoordinatorDelegate {}
