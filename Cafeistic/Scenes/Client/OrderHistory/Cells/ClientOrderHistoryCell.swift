//
//  ClientOrderHistoryCell.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.05.2021.
//

import Foundation
import UIKit
import SnapKit

final class ClientOrderHistoryCell: UITableViewCell {
    
    var viewModel: ClientOrderHistoryCellModel? {
        didSet {
            establismentImageView.image = viewModel?.image
            establismentNameLabel.text = viewModel?.establishmentName
            totalMoneyLabel.text = viewModel?.totalExpense
            dateLabel.text = viewModel?.date
        }
    }
    
    private lazy var backgroudWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.roundCorders(corners: .all, radius: 10)
        return view
    }()
    
    private lazy var establismentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.roundCorders(corners: .all, radius: 10)
        return imageView
    }()
    
    private lazy var establismentNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var totalMoneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var detailButton: UIButton = {
        let button = UIButton()
        button.setTitle(StringConstant.Scenes.ClientOrderHistory.detail, for: .normal)
        button.backgroundColor = .appOrange
        button.roundCorders(corners: .all, radius: 7)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        return button
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
        backgroudWhiteView.addSubviews(establismentImageView,
                                       establismentNameLabel,
                                       totalMoneyLabel,
                                       dateLabel,
                                       detailButton)
    }
    
    private func configureConstraints() {
        backgroudWhiteView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview().inset(2)
        }
        establismentImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10)
            $0.height.width.equalTo(70)
        }
        establismentNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(establismentImageView.snp.trailing).offset(5)
        }
        totalMoneyLabel.snp.makeConstraints {
            $0.top.equalTo(establismentNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(establismentImageView.snp.trailing).offset(6)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(totalMoneyLabel.snp.bottom).offset(1)
            $0.leading.equalTo(establismentImageView.snp.trailing).offset(6)
        }
        detailButton.snp.makeConstraints {
            $0.leading.equalTo(establismentImageView.snp.trailing).offset(5)
            $0.top.equalTo(dateLabel.snp.bottom).offset(3)
            $0.height.equalTo(17)
            $0.width.equalTo(80)
        }
    }
}
