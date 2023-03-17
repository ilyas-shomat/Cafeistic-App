//
//  CoordinatableDelagate.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.03.2023.
//

import Foundation

protocol CoordinatableDelagate {
    
//    MARK: - Responsible for flow completion
    var flowCompletion: CompletionHandler? { get set }
}
