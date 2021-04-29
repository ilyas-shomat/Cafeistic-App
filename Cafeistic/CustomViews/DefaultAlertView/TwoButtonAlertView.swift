//
//  DefaultAlertView.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.04.2021.
//

import Foundation
import UIKit
import SnapKit

final class TwoButtonAlertView: UIView {
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private lazy var topButton: MainButton = {
        let button = MainButton(style: .rounded)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var bottomButton: MainButton = {
        let button = MainButton(style: .clear)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var message: String? {
        didSet {
            topLabel.text = message
        }
    }
    
    var topButtonTitle: String? {
        didSet {
            topButton.setTitle(topButtonTitle, for: .normal)
        }
    }
    
    var bottomButtonTitile: String? {
        didSet {
            bottomButton.setTitle(bottomButtonTitile, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 15
        
        configureSubViews()
        configureConstraints()
    }
    
    private func configureSubViews() {
        addSubviews(topLabel,
                    topButton,
                    bottomButton)
    }
    
    private func configureConstraints() {
        topLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        topButton.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).inset(-20)
            $0.height.equalTo(45)
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.centerX.equalToSuperview()
        }
        bottomButton.snp.makeConstraints {
            $0.top.equalTo(topButton.snp.bottom)
            $0.height.equalTo(45)
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}
