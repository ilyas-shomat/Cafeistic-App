//
//  MainTextField.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation
import UIKit

final class MaintextField: UITextField {
    
    var style: MainTextFieldStyle {
        didSet {
            configure(style)
        }
    }
    
    private lazy var containerViewForIcon: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        let iconTappedGesture = UITapGestureRecognizer()
        iconTappedGesture.addTarget(self, action: #selector(textSecureIconTapped))
        view.addGestureRecognizer(iconTappedGesture)
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var textSecureIcon: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: -4.0, y: 8.0, width: 22.0, height: 22.0))
        imageView.image = Assets.visibilityOffIcon.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(style: MainTextFieldStyle) {
        self.style = style
        super.init(frame: .zero)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {
        containerViewForIcon.addSubview(textSecureIcon)
        rightViewMode = UITextField.ViewMode.always
        rightView = containerViewForIcon
        
        delegate = self
        
        layer.cornerRadius = 22.5
        self.backgroundColor = .white
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        configure(style)
    }
    
    private func configure(_ style: MainTextFieldStyle) {
        switch style {
        case .login:
            isSecureTextEntry = false
            placeholder = StringConstant.Scenes.Login.login
            textSecureIcon.isHidden = true
            keyboardType = .asciiCapable
        case .password:
            isSecureTextEntry = true
            placeholder = StringConstant.Scenes.Login.password
            textSecureIcon.isHidden = false
            keyboardType = .asciiCapable
            containerViewForIcon.isUserInteractionEnabled = true
        case .regular:
            isSecureTextEntry = false
            placeholder = ""
            textSecureIcon.isHidden = true
            keyboardType = .asciiCapable
        case .email:
            keyboardType = .emailAddress
        }
    }
    
    @objc private func textSecureIconTapped() {
        self.isSecureTextEntry.toggle()
        if textSecureIcon.image == Assets.visibilityOffIcon.image {
            textSecureIcon.image = Assets.visibilityOnIcon.image
        }
        else {
            textSecureIcon.image = Assets.visibilityOffIcon.image
        }
    }
}

extension MaintextField: UITextFieldDelegate {
    
}
