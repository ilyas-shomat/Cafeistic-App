//
//  UIView+AddSubviews.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        addSubviews(views)
    }
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}
