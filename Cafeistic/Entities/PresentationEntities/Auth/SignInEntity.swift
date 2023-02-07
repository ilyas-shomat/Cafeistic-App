//
//  SignInEntity.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.06.2021.
//

import Foundation

struct SignInEntity: EntityPresentationToServiceFormatter {
    var username: String
    var password: String
    
    func getServiceEntity() -> SignInRequestEntity {
        .init(username: username, password: password)
    }
}
