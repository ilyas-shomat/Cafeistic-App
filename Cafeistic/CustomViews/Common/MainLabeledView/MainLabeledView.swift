//
//  MainLabeledView.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.11.2021.
//

import Foundation
import UIKit
import SwiftUI

final class MainLabeledView: UIView {
    
    private var iconImageName: String {
        didSet {
            iconImage.image = UIImage(named: iconImageName)
        }
    }
    
    private var labelText: String {
        didSet {
            label.text = labelText
        }
    }
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(iconImageName: String, labelText: String) {
        self.iconImageName = iconImageName
        self.labelText = labelText
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews([iconImage, label])
    }
    
    private func configureConstraints() {
        iconImage.snp.makeConstraints {
//            $0.top.bottom.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(25)
        }
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(iconImage.snp.trailing).offset(15)
        }
    }
}
