//
//  MainNavigationBarView.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 25.05.2021.
//

import Foundation
import UIKit

final class MainNavigationBarView: UIView {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    init(title: String) {
        self.titleLabel.text = title
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .appOrange
        roundCorners(corners: [.topRight, .bottomRight], radius: 10)
        
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(titleLabel)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
