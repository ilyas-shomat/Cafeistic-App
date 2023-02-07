//
//  SignInSceneMock.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 07.02.2023.
//

import Foundation
@testable import Cafeistic

final class SignInSceneMock: SignInSceneDelegate {
    var isTokenLoaded = false
    
    func tokenLoaded() {
        isTokenLoaded = true
    }
}
