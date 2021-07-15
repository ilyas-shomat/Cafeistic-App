//
//  JsonFactory.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 03.07.2021.
//

import Foundation

enum JsonFactory {
    case token
    
    var name: String {
        switch self {
        case .token:
            return "UnitTestToken"
        }
    }
}
