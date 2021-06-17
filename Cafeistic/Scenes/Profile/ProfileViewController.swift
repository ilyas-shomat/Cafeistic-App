//
//  ProfileViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.05.2021.
//  
//

import UIKit

class ProfileViewController: DefaultViewController {
    
    var presenter: ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
        
        //MARK: Not forget to delete it
        AuthenticationStore.shared.removeToken()
    }
    
}

extension ProfileViewController: SetupBaseViewController {
    func setupViews() {
        configureSubViews()
        configureConstraints()
    }
    
    func configureSubViews() {
        
    }
    
    func configureConstraints() {
        
    }
    
    func setupActions() {
        
    }
    
}

// MARK: - (Presenter -> View)
extension ProfileViewController: PresenterToViewProfileProtocol{

}
