//
//  CurrentOrderAcceptView.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 25.05.2021.
//

import Foundation
import UIKit

final class CurrentOrderAcceptView: UIView {
    
    var price: String? {
        didSet {
            priceLabel.text = price
        }
    }
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstant.Scenes.ClientCurrentOrder.total
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .appOrange
        return label
    }()
    
    private lazy var acceptButton: AppButton = {
        let button = AppButton(style: .rounded)
        button.setTitle(StringConstant.Scenes.ClientCurrentOrder.acceptReceiving, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        roundCorners(corners: [.topLeft, .topRight], radius: 20)
        
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubviews(totalLabel,
                    priceLabel,
                    acceptButton)
    }
    
    private func configureConstraints() {
        totalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.leading.equalToSuperview().inset(28)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview().inset(28)
        }
        acceptButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(45)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
    }
}
