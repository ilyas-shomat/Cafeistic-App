//
//  ClientCurrentOrderViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 24.05.2021.
//  
//

import UIKit

class ClientCurrentOrderViewController: DefaultViewController {
    
    var presenter: ViewToPresenterClientCurrentOrderProtocol?
    
    override func viewDidLoad() {
        
        view.backgroundColor = .red
        super.viewDidLoad()
        presenter?.load()
        setupViews()
    }
    
}

extension ClientCurrentOrderViewController: SetupBaseViewController {
    func setupViews() {
//        setupTabBar()
    }
    
    func configureSubViews() {
        
    }
    
    func configureConstraints() {
        
    }
    
    func setupActions() {
        
    }
    
//    private func setupTabBar() {
//        navigationController?.tabBarItem = UITabBarItem(title: "",
//                                                        image: Assets.currentOrderUnselectedTabBar.image,
//                                                        selectedImage: Assets.currentOrderTabBar.image)
//    }

}

// MARK: - (Presenter -> View)
extension ClientCurrentOrderViewController: PresenterToViewClientCurrentOrderProtocol{

}
