//
//  Router.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 13.03.2023.
//

import Foundation
import UIKit

final class Router: NSObject, UINavigationControllerDelegate {
    var navigationScene: NavigationScene

    init(navigationScene: NavigationScene = .init()) {
        self.navigationScene = navigationScene
        super.init()
        self.navigationScene.delegate = self
    }
}

extension Router: Routable {
    var toPresentable: UIViewController { navigationScene }
}
