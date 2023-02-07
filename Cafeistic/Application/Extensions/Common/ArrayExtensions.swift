//
//  ArrayExtensions.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 06.02.2023.
//

import Foundation

extension Array where Element: EntityServiceToPresentationFormatter {
    func formatServiceEntityToPresentationEntity() -> [Element.T] {
        self.map { return $0.getPresentationEntity() }
    }
}

extension Array where Element: EntityDefaultValues {
    func getAllDefaultValues() -> [Element] {
        var elements: [Element] = .init()
        
        for _ in 0...20 {
            elements.append(Element.getDefaultValues())
        }
        
        return elements
    }
}
