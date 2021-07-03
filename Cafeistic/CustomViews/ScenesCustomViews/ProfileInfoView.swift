//
//  ProfileInfoView.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 21.06.2021.
//

import Foundation
import UIKit

enum ProfileInfoViewIconType {
    case username
    case phoneNumber
    case email
}

final class ProfileInfoView: UIView {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }

    private func configureSubviews() {
        addSubviews(iconImageView, titleLabel)
    }
    
    private func configureConstraints() {
        
    }
}
