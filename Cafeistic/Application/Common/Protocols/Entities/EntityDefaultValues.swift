//
//  EntityDefaultValues.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 06.02.2023.
//

import Foundation

protocol EntityDefaultValues: Hashable, Identifiable {
    static func getDefaultValues() -> Self
}
