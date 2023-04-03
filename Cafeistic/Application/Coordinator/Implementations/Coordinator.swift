//
//  Coordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 13.03.2023.
//

import Foundation
import UIKit
import Combine

class Coordinator: Coordinatable {
    var childCoordinators: [Coordinatable] = []
    var router: Routable
    var coordinatingType: CoordinatingType
    var completion: CompletionHandler?
    
    var root: Presentable {
        fatalError("Root must be overrided")
    }
    
    init(
        router: Routable = Router(),
        coordinatingType: CoordinatingType = .newFlow
    ) {
        self.router = router
        self.coordinatingType = coordinatingType
    }
}

