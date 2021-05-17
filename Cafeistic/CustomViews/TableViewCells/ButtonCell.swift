//
//  TableViewButtonCell.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 11.05.2021.
//

import Foundation
import UIKit
import SnapKit

final class TableViewButtonCell: UITableViewCell {
    
    var style: MainButtonStyle? {
        didSet {
            button.style = style ?? .rounded
        }
    }
    
    var title: String? {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }
    
    private lazy var button: MainButton = {
        let button = MainButton(style: .rounded)
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
        contentView.addSubview(button)
    }
    
    private func configureConstraints() {
        button.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.height.equalTo(45)
        }
    }
}
