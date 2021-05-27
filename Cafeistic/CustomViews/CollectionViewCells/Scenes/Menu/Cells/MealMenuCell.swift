//
//  MealMenuCell.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 04.05.2021.
//

import Foundation
import SnapKit
import UIKit

final class MealMenuCell: UICollectionViewCell {
    
    var viewModel: MealMenuCellModel? {
        didSet {
            mealImageView.image = UIImage(named: viewModel?.imageName ?? String())
            mealNameLabel.text = viewModel?.name
            priceNameLabel.text = viewModel?.price
        }
    }
    
    private lazy var mealNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .appOrange
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var priceNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private lazy var mealImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "tepm_1_img")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        
        configureSubViews()
        configureConstraints()
    }
    
    private func configureSubViews() {
        addSubviews(mealImageView,
                    mealNameLabel,
                    priceNameLabel)
    }
    
    private func configureConstraints() {
        mealImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
            $0.centerX.equalToSuperview()
        }
        mealNameLabel.snp.makeConstraints {
            $0.top.equalTo(mealImageView.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(26)
        }
        priceNameLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(24)
        }
    }
}
