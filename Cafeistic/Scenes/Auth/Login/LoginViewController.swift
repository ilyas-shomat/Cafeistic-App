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
                         passwordTextField)
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
            $0.height.equalTo(50)
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.centerX.equalToSuperview()
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).inset(-10)
            $0.height.equalTo(50)
            $0.width.equalTo(loginTextField)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupActions() {
        
    }
}

// MARK: - (Presenter -> View)
extension LoginViewController: PresenterToViewLoginProtocol{

}
