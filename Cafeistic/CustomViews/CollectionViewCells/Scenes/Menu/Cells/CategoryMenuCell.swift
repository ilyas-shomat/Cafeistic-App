//
//  CategoryMenuCell.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 04.05.2021.
//

import Foundation
import SnapKit
import UIKit

final class CategoryMenuCell: UICollectionViewCell {
    
    var viewModel: CategoryMenuCellModel? {
        didSet {
            if viewModel?.isSelected == true {
                self.backgroundColor = .appOrange
                self.categoryNameLabel.textColor = .white
            }
            categoryNameLabel.text = viewModel?.title
        }
    }
    
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.text = "temp text"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .appOrange
        return label
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
        self.layer.cornerRadius = 10
        configureSubViews()
        configureConstraints()
    }
    
    private func configureSubViews() {
        addSubview(categoryNameLabel)
    }
    
    private func configureConstraints() {
        categoryNameLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
    }
}
