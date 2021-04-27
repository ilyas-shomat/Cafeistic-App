//
//  Assets.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation
import UIKit

internal enum Assets {
    case visibilityOnIcon
    case visibilityOffIcon
    
    public var image: UIImage? {
        switch self {
        case .visibilityOnIcon:
            return UIImage(systemName: "eye.fill")
        case .visibilityOffIcon:
            return UIImage(systemName: "eye")
        }
    }
}
