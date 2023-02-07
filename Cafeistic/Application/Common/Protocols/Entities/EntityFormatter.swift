//
//  EntityFormatter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 06.02.2023.
//

import Foundation

protocol EntityServiceToPresentationFormatter {
    associatedtype T
    
    func getPresentationEntity() -> T
}

protocol EntityPresentationToServiceFormatter {
    associatedtype T
    
    func getServiceEntity() -> T
}
