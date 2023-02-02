//
//  Presentable.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 18.08.2022.
//

import Foundation
import UIKit

protocol Presentable {
    func toPresentable() -> UIViewController
}

extension UIViewController: Presentable {
    public func toPresentable() -> UIViewController {
        return self
    }
}

