//
//  MainButton.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.04.2021.
//

import Foundation
import UIKit

final class AppButton: UIButton, IndicatableView {
 
//    var isActive: Bool = false {
//        didSet {
//            setActive(isActive)
//        }
//    }
    
    var style: MainButtonStyle {
        didSet {
            configure(style)
        }
    }
    
    init(style: MainButtonStyle) {
        self.style = style
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 22.5
        layer.backgroundColor = UIColor.appOrange.cgColor
        configure(style)
    }
    
    private func configure(_ style: MainButtonStyle) {
        switch style {
        case .rounded:
            layer.cornerRadius = 22.5
            layer.backgroundColor = UIColor.appOrange.cgColor
        case .squared:
            layer.cornerRadius = 5.0
            layer.backgroundColor = UIColor.appOrange.cgColor
        case .clear:
            layer.cornerRadius = 22.5
            layer.backgroundColor = UIColor.clear.cgColor
            self.setTitleColor(.appOrange, for: .normal)
        }
    }
    
//    private func setActive(_ active: Bool) {
//        isEnabled = active
//        if active {
//            backgroundColor = ColorName.mainGreen.color
//            setTitleColor(.white, for: .normal)
//        } else {
//            backgroundColor = ColorName.lightGray.color
//            setTitleColor(ColorName.darkGray.color, for: .normal)
//        }
//    }
}
