//
//  FakeSessionTrackerImpl.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 03.07.2021.
//

import Foundation
@testable import Cafeistic


final class MockSessionTrackerImpl: SessionTracker {
    var isLoggedIn: Bool
    
    var isFirstLaunch: Bool
    
    init() {
        isLoggedIn = false
        isFirstLaunch = false
    }
    
    func updateToken(token: String) {
        
    }
    
    func logout() {
        
    }
}
