//
//  ProfileViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.05.2021.
//  
//

import UIKit

class ProfileViewController: DefaultViewController {
    
    private lazy var navigationView: MainNavigationBarView = {
        let view = MainNavigationBarView(title: StringConstant.Scenes.Profile.profile)
        return view
    }()
    
    var presenter: ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
    }
    
}

extension ProfileViewController: SetupBaseViewController {
    func setupViews() {
        configureSubViews()
        configureConstraints()
        setupNavigationBarView()
    }
    
    func configureSubViews() {
        
    }
    
    func configureConstraints() {
        
    }
    
    func setupActions() {
        
    }
    
    private func setupNavigationBarView() {
        navigationController?.navigationBar.addSubview(navigationView)

        navigationView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.equalToSuperview()
            $0.width.equalTo(230)
        }
    }
    
}

// MARK: - (Presenter -> View)
extension ProfileViewController: PresenterToViewProfileProtocol{

}
