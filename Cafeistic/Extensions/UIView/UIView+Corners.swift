//
//  UIView+Corners.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 05.05.2021.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorders(corners: [ViewRoundingCorners], radius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = radius

        var cornerMasks: CACornerMask = []
        
        for corner in corners {
            switch  corner {
            case .topRight:
                cornerMasks.insert(.layerMaxXMinYCorner)
            case .topLeft:
                cornerMasks.insert(.layerMinXMinYCorner)
            case .bottomRight:
                cornerMasks.insert(.layerMaxXMaxYCorner)
            case .bottomLeft:
                cornerMasks.insert(.layerMinXMaxYCorner)
            default:
                return
            }
        }
    
        layer.maskedCorners = cornerMasks
    }
    
    func roundCorders(corners: ViewRoundingCorners, radius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        
        switch  corners {
        case .all:
            layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        default:
            return
        }
    }
}
