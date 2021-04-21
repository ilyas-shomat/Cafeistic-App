//
//  AppSetup.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 21.04.2021.
//

import Foundation
import UIKit

class AppSetup {
    
    public static let shared = AppSetup()

    func setupRootScene(window: UIWindow) {
        window.rootViewController = TempTestViewController()
        window.makeKeyAndVisible()
    }
}
