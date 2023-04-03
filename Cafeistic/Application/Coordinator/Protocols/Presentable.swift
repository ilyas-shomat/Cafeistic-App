//
//  Presentable.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 13.03.2023.
//

import Foundation
import UIKit

protocol Presentable {
    var toPresentable: UIViewController? { get }
}
