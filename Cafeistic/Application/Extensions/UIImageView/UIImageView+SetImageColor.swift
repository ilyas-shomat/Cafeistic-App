//
//  UIImageView+SetImageColor.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 17.05.2021.
//

import Foundation
import UIKit

extension UIImageView {
    
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
