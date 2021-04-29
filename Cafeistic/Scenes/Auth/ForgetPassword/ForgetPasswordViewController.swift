//
//  ForgetPasswordViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 29.04.2021.
//  
//

import UIKit

class ForgetPasswordViewController: DefaultViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.appLogo.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var emailTextField: MaintextField = {
        let textField = MaintextField(style: .regular)
        textField.placeholder = StringConstant.Scenes.ForgetPassword.enterEmail
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var sendButton: MainButton = {
        let button = MainButton(style: .rounded)
        button.setTitle(StringConstant.Scenes.ForgetPassword.send, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var presenter: ViewToPresenterForgetPasswordProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
        setupActions()
    }
    
}

extension ForgetPasswordViewController: SetupBaseViewController {
    func setupViews() {
        configureSubViews()
        configureConstraints()
    }
    
    func setupActions() {
        
    }
    
    private func configureSubViews() {
        view.addSubviews(logoImageView,
                         emailTextField,
                         sendButton)
    }
    
    private func configureConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(255)
            $0.height.equalTo(255)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).inset(-35)
            $0.height.equalTo(45)
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.centerX.equalToSuperview()
        }
        sendButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).inset(-15)
            $0.height.equalTo(50)
            $0.width.equalTo(emailTextField)
            $0.centerX.equalToSuperview()
        }
    }
}

// MARK: - (Presenter -> View)
extension ForgetPasswordViewController: PresenterToViewForgetPasswordProtocol{

}
