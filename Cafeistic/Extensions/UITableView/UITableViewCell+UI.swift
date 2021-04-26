//
//  UITableViewCell+UI.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    func removeSeparator() {
        separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width, bottom: 0, right: 0)
    }
}
