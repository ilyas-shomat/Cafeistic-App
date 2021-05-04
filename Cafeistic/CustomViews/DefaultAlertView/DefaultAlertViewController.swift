//
//  DefaultAlertViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.04.2021.
//

import Foundation
import UIKit
import SnapKit

protocol DefaultAlertViewControllerActionsHandle {
    func tappedTopButton()
    func tappedBottomButton()
}

final class DefaultAlertViewController: UIViewController, SetupBaseViewController {
    
    private lazy var twoButtonAlertView: TwoButtonAlertView = {
        let view = TwoButtonAlertView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.handleTopButtonTap = { [weak self] in
            self?.handleViewTopButtonTap()
        }
        view.handleBottomButtonTap = { [weak self] in
            self?.handleViewBottomButtonTap()
        }
        return view
    }()
    
    var message: String? {
        didSet {
            twoButtonAlertView.message = message
        }
    }
    
    var topButtonTitle: String? {
        didSet {
            twoButtonAlertView.topButtonTitle = topButtonTitle
        }
    }
    
    var bottomButtonTitile: String? {
        didSet {
            twoButtonAlertView.bottomButtonTitile = bottomButtonTitile
        }
    }
    
    var delegate: DefaultAlertViewControllerActionsHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        self.twoButtonAlertView.alpha = 1.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        view.addGestureRecognizer(tap)
        
        configureSubviews()
        configureConstraints()
    }
    
    func setupActions() {
        
    }
    
    func configureSubviews() {
        view.addSubview(twoButtonAlertView)
    }
    
    func configureConstraints() {
        twoButtonAlertView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func handleViewTopButtonTap() {
        close()
        delegate?.tappedTopButton()
    }
    
    private func handleViewBottomButtonTap() {
        close()
        delegate?.tappedBottomButton()
    }
}
