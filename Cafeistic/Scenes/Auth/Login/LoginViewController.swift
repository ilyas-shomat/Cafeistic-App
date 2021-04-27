//
//  LoginViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//  
//

import UIKit
import SnapKit

class LoginViewController: DefaultViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.appLogo.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var loginTextField: MaintextField = {
        let textField = MaintextField(style: .login)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: MaintextField = {
        let textField = MaintextField(style: .password)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signInButton: MainButton = {
        let button = MainButton(style: .rounded)
        button.setTitle(StringConstant.Scenes.Login.signIn, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var forgetPasswordButton: MainButton = {
        let button = MainButton(style: .clear)
        button.setTitle(StringConstant.Scenes.Login.forgetPassword, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var notSignUpYetLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstant.Scenes.Login.notSignUpYet
        label.textColor = UIColor.appLightGray
        return label
    }()
    
    private lazy var signUpButton: MainButton = {
        let button = MainButton(style: .clear)
        button.setTitle(StringConstant.Scenes.Login.signUp, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var presenter: ViewToPresenterLoginProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
        setupActions()
    }
    
}

extension LoginViewController: SetupBaseViewController {
    
    func setupViews() {
        configureSubViews()
        configureConstraints()
    }
    
    private func configureSubViews() {
        view.addSubviews(logoImageView,
                         loginTextField,
                         passwordTextField,
                         signInButton,
                         forgetPasswordButton,
                         signUpButton,
                         notSignUpYetLabel)
    }
    
    private func configureConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(255)
            $0.height.equalTo(255)
        }
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).inset(-35)
            $0.height.equalTo(45)
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.centerX.equalToSuperview()
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).inset(-10)
            $0.height.equalTo(45)
            $0.width.equalTo(loginTextField)
            $0.centerX.equalToSuperview()
        }
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-15)
            $0.height.equalTo(50)
            $0.width.equalTo(loginTextField)
            $0.centerX.equalToSuperview()
        }
        forgetPasswordButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).inset(5)
            $0.height.equalTo(50)
            $0.width.equalTo(loginTextField)
            $0.centerX.equalToSuperview()
        }
        signUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(loginTextField)
            $0.centerX.equalToSuperview()
        }
        notSignUpYetLabel.snp.makeConstraints {
            $0.bottom.equalTo(signUpButton.snp.top).inset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupActions() {
        signInButton.addTarget(self, action: #selector(tapSignInButton), for: .touchUpInside)
        forgetPasswordButton.addTarget(self, action: #selector(tapForgetPasswordButton), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
    }
    
    @objc private func tapSignInButton() {
        presenter?.handleSignInTap()
    }
    
    @objc private func tapForgetPasswordButton() {
        presenter?.handleForgetPasswordTap()
    }
    
    @objc private func tapSignUpButton() {
        presenter?.handleSignUpTap()
    }
}

// MARK: - (Presenter -> View)
extension LoginViewController: PresenterToViewLoginProtocol{

}
