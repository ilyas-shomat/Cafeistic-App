//
//  UIView+Identifier.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 04.05.2021.
//

import Foundation
import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
