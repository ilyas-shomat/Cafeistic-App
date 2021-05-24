//
//  ClientCurrentOrderMealCell.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 24.05.2021.
//

import Foundation
import UIKit
import SnapKit

final class ClientCurrentOrderMealCell: UITableViewCell {
    
    var viewModel: ClientCurrentOrderMealCellModel? {
        didSet {
            mealImageView.image = viewModel?.image
            mealNameLabel.text = viewModel?.mealName
            mealDescriptionLabel.text = viewModel?.description
            mealCountLabel.text = viewModel?.count
        }
    }
    
    private lazy var backgroudWhiteView: UIView = {
        let view  = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var mealNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var mealDescriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var mealCountView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var mealCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        contentView.addSubview(backgroudWhiteView)
        backgroudWhiteView.addSubviews(mealImageView,
                                mealNameLabel,
                                mealDescriptionLabel,
                                mealCountView)
        mealCountView.addSubview(mealCountLabel)
    }
    
    private func configureConstraints() {
        backgroudWhiteView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview().inset(2)
        }
        mealImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(5)
            $0.top.bottom.equalToSuperview().inset(5)
            $0.height.width.equalTo(45)
            $0.centerY.equalToSuperview()
        }
    }
}
