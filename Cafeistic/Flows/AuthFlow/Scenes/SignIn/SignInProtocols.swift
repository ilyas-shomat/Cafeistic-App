//
//  SignInProtocols.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 02.02.2023.
//

import Foundation

protocol SignInSceneDelegate {
    func reactionFromInteractor()
}

protocol SingInInteractorDelegate {
    var scene: SignInSceneDelegate? { get set }
    
    func sendUserData(entity: SignInEntity)
}

protocol SignInCoordinatorDelegate {}
