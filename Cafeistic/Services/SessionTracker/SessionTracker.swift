//
//  SessionTracker.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 14.06.2021.
//

import Foundation

protocol SessionTracker: class {
    
    var isLoggedIn: Bool { get }
    var isFirstLaunch: Bool { get }
    
    func updateToken(token: String)
    func logout()
}
