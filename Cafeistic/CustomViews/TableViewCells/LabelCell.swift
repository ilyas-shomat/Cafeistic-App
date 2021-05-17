//
//  LabelCell.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 11.05.2021.
//

import Foundation
import UIKit
import SnapKit

final class TableViewLabelCell: UITableViewCell {
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var color: UIColor? {
        didSet {
            titleLabel.textColor = color
        }
    }
    
    var textFont: UIFont? {
        didSet {
            titleLabel.font = textFont
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 20)
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
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(titleLabel)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
    }
}
