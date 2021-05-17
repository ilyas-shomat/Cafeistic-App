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
        label.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(titleLabel)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.85)
        }
    }
}
