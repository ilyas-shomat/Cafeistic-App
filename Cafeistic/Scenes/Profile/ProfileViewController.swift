//
//  ProfileViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.05.2021.
//  
//

import UIKit

class ProfileViewController: DefaultViewController {
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var editDataButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var usernameView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var phoneNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var changePasswordButton: MainButton = {
        let button = MainButton(style: .squared)
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
        
    }
    
    func configureConstraints() {
        
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
