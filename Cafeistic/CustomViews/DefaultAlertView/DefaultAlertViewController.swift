//
//  DefaultAlertViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.04.2021.
//

import Foundation
import UIKit
import SnapKit


final class DefaultAlertViewController: UIViewController, SetupBaseViewController {
    
    private lazy var twoButtonAlertView: TwoButtonAlertView = {
        let view = TwoButtonAlertView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.backgroundColor = .clear
//            self.twoButtonAlertView.alpha = 0.0
//        }, completion: { _ in
//            self.dismiss(animated: false, completion: nil)
//        })
    }
    
}
