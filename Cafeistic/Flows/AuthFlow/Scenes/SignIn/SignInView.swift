//
//  SignInView.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 02.02.2023.
//

import Foundation
import UIKit

enum SignInViewActions {
    case signInButtonTapped(loginText: String, passwordText: String)
    case forgetPasswordTapped
    case signUpButtonTapped
}

final class SignInView: UIView {
    private lazy var logoImageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.image = Assets.appLogo.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var loginTextField: AppTextField = {
        let texfield: AppTextField = .init(style: .login)
        return texfield
    }()
    
    private lazy var passwordTextField: AppTextField = {
        let texfield: AppTextField = .init(style: .password)
        return texfield
    }()
    
    private lazy var signInButton: AppButton = {
        let button: AppButton = .init(style: .rounded)
        button.setTitle(StringConstant.Scenes.SignIn.signIn, for: .normal)
        button.addTarget(self, action: #selector(tapSignInButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgetPasswordButton: AppButton = {
        let button: AppButton = .init(style: .clear)
        button.setTitle(StringConstant.Scenes.SignIn.forgetPassword, for: .normal)
        button.addTarget(self, action: #selector(tapForgetPasswordButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var notSignUpYetLabel: UILabel = {
        let label: UILabel = .init()
        label.textAlignment = .center
        label.text = StringConstant.Scenes.SignIn.notSignUpYet
        label.textColor = .appLightGray
        return label
    }()
    
    private lazy var signUpButton: AppButton = {
        let button: AppButton = .init(style: .clear)
        button.setTitle(StringConstant.Scenes.SignIn.signUp, for: .normal)
        button.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
        return button
    }()
    
    private var triggerAction: ((SignInViewActions) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(triggerAction: ((SignInViewActions) -> Void)?) {
        self.init(frame: .zero)
        self.triggerAction = triggerAction
        
        setupView()
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .appGray
    }
    
    @objc private func tapSignInButton() {
        triggerAction?(
            .signInButtonTapped(
                loginText: loginTextField.text ?? "",
                passwordText: passwordTextField.text ?? ""
            )
        )
    }
    
    @objc private func tapSignUpButton() { triggerAction?(.signUpButtonTapped) }
    @objc private func tapForgetPasswordButton() { triggerAction?(.forgetPasswordTapped) }
    
    private func configureSubviews() {
        addSubviews(
            [
                logoImageView,
                loginTextField,
                passwordTextField,
                signInButton,
                forgetPasswordButton,
                notSignUpYetLabel,
                signUpButton
            ]
        )
    }
    
    private func configureConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
        
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(60)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(15)
            $0.leading.equalTo(loginTextField.snp.leading)
            $0.trailing.equalTo(loginTextField.snp.trailing)
            $0.height.equalTo(50)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.equalTo(loginTextField.snp.leading)
            $0.trailing.equalTo(loginTextField.snp.trailing)
            $0.height.equalTo(50)
        }
        
        forgetPasswordButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(10)
            $0.leading.equalTo(loginTextField.snp.leading)
            $0.trailing.equalTo(loginTextField.snp.trailing)
            $0.height.equalTo(50)
        }
        
        notSignUpYetLabel.snp.makeConstraints {
            $0.leading.equalTo(loginTextField.snp.leading)
            $0.trailing.equalTo(loginTextField.snp.trailing)
            $0.height.equalTo(50)
            $0.bottom.equalTo(signUpButton.snp.top).offset(10)
        }
        
        signUpButton.snp.makeConstraints {
            $0.leading.equalTo(loginTextField.snp.leading)
            $0.trailing.equalTo(loginTextField.snp.trailing)
            $0.height.equalTo(25)
            $0.bottom.equalToSuperview().offset(-40)
        }
    }
}

