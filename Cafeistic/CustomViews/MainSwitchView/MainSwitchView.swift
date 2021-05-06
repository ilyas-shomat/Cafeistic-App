//
//  MainSwitchView.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 06.05.2021.
//

import UIKit
import SnapKit

protocol MainSwitchViewDelegate: class {
    func didSelect(option: Int)
}

final class MainSwitchView: UIView {
    
    weak var delegate: MainSwitchViewDelegate?
    
    var firstOptionText: String? {
        didSet {
            firstOptionLabel.text = firstOptionText
        }
    }
    
    var secondOptionText: String? {
        didSet {
            secondOptionLabel.text = secondOptionText
        }
    }
    
    private(set) var selectedOption: Int = 0 {
        didSet {
            delegate?.didSelect(option: selectedOption)
            update(with: selectedOption)
        }
    }
    
    private lazy var firstOptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didSelectFirstOption))
        label.addGestureRecognizer(tap)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondOptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didSelectSecondOption))
        label.addGestureRecognizer(tap)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var switchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let activeColor = UIColor.appOrange
    private let inactiveColor = UIColor.white
    
    private var firstOptionLeadingConstraint: NSLayoutConstraint?
    private var firstOptionTrailingConstraint: NSLayoutConstraint?
    private var secondOptionLeadingConstraint: NSLayoutConstraint?
    private var secondOptionTrailingConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
        
    private func setupView() {
        layer.cornerRadius = 16
        layer.masksToBounds = true
        backgroundColor = .appOrange
        configureSubviews()
        configureConstraints()
        update(with: selectedOption)
    }
    
    private func configureSubviews() {
        addSubviews(switchView, firstOptionLabel, secondOptionLabel)
    }
    
    private func configureConstraints() {
        switchView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(2)
        }
        firstOptionLeadingConstraint = switchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2)
        firstOptionTrailingConstraint = switchView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -2)
        secondOptionLeadingConstraint = switchView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 2)
        secondOptionTrailingConstraint = switchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2)
        
        firstOptionLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalTo(snp.centerX).offset(-4)
        }
        
        secondOptionLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-4)
            $0.leading.equalTo(snp.centerX).offset(4)
        }
    }
    
    @objc private func didSelectFirstOption() {
        guard selectedOption != 0 else {
            return
        }
        selectedOption = 0
    }
    
    @objc private func didSelectSecondOption() {
        guard selectedOption != 1 else {
            return
        }
        selectedOption = 1
    }
    
    private func update(with selectedOption: Int) {
        UIView.transition(with: firstOptionLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.firstOptionLabel.textColor = selectedOption == 0 ? self.activeColor : self.inactiveColor
        })
        
        UIView.transition(with: secondOptionLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.secondOptionLabel.textColor = selectedOption == 1 ? self.activeColor : self.inactiveColor
        })
        
        self.firstOptionLeadingConstraint?.isActive = selectedOption == 0
        self.firstOptionTrailingConstraint?.isActive = selectedOption == 0
        self.secondOptionLeadingConstraint?.isActive = selectedOption == 1
        self.secondOptionTrailingConstraint?.isActive = selectedOption == 1

        UIView.animate(withDuration: 0.6,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.7,
                       options: [.curveEaseIn, .allowUserInteraction],
                       animations: {
                        self.layoutIfNeeded()
        })
    }
}
