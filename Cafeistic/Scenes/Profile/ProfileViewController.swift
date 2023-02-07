//
//  ProfileViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.05.2021.
//  
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "tempImage")
        imageView.roundCorners(corners: .all, radius: 60)
        return imageView
    }()
    
    private lazy var userFullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var editDataButton: UIButton = {
        let button = UIButton()
        button.setTitle(StringConstant.Scenes.Profile.editUserInfo, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
//    private lazy var usernameView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .green
//        return view
//    }()
    
    private lazy var usernameView: MainLabeledView = {
        let view = MainLabeledView(iconImageName: "", labelText: "ШОмат Ілияс")
        return view
    }()
    
    private lazy var phoneNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var changePasswordButton: AppButton = {
        let button = AppButton(style: .squared)
        return button
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setImage(Assets.logoutIcon.image, for: .normal)
        button.addTarget(self, action: #selector(tapLogoutButton), for: .touchUpInside)
        return button
    }()
    
    var presenter: ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
        
        //MARK: Not forget to delete it
//        AuthenticationStore.shared.removeToken()
    }
    
}

extension ProfileViewController: SetupBaseViewController {
    func setupViews() {
        configureSubViews()
        configureConstraints()
        setupNavigationBar()
    }
    
    func configureSubViews() {
        view.addSubviews([profileImageView,
                          userFullNameLabel,
                          editDataButton,
                          usernameView,
                          phoneNumberView,
                          emailView,
                          changePasswordButton
        ])
    }
    
    func configureConstraints() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.width.height.equalTo(150)
            $0.centerX.equalToSuperview()
        }
        userFullNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.centerX.equalToSuperview()
        }
        editDataButton.snp.makeConstraints {
            $0.top.equalTo(userFullNameLabel.snp.bottom).offset(10)
            $0.width.equalTo(180)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        usernameView.snp.makeConstraints {
            $0.top.equalTo(editDataButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        phoneNumberView.snp.makeConstraints {
            $0.top.equalTo(usernameView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        emailView.snp.makeConstraints {
            $0.top.equalTo(phoneNumberView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        changePasswordButton.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        
    }
    
    func setupActions() {
        
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logoutButton)
    }
    
    @objc private func tapLogoutButton() {
        presenter?.handleLogoutTap()
    }
    
}

// MARK: - (Presenter -> View)
extension ProfileViewController: PresenterToViewProfileProtocol{

}
