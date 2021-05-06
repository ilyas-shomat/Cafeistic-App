//
//  EstablishmentSignUpViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import UIKit
import SnapKit

class EstablishmentSignUpViewController: DefaultViewController {
    
    private lazy var switchView: MainSwitchView = {
        let view = MainSwitchView(frame: CGRect(x: 0, y: 0, width: 264, height: 34))
        view.firstOptionText = StringConstant.Scenes.EstablishmentSignUp.staff
        view.secondOptionText = StringConstant.Scenes.EstablishmentSignUp.owner
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    var presenter: ViewToPresenterEstablishmentSignUpProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
    }
    
}

extension EstablishmentSignUpViewController {
    
    func setupViews() {
        configureBaseSubViews()
        configureBaseConstraints()
    }
    
    func configureBaseSubViews() {
        navigationController?.navigationBar.addSubview(switchView)
    }
    
    func configureBaseConstraints() {
        switchView.snp.makeConstraints {
            $0.width.equalTo(264)
            $0.height.equalTo(34)
            $0.center.equalToSuperview()
        }
    }
    
    func setupStaffViews(signUpType: SignUpType) {
    }
    
    func setupEstablishmentViews() {
        
    }
    
    func setupActions() {
        
    }
}

// MARK: - (Presenter -> View)
extension EstablishmentSignUpViewController: PresenterToViewEstablishmentSignUpProtocol {

}

extension EstablishmentSignUpViewController: MainSwitchViewDelegate {
    func didSelect(option: Int) {
        
    }
}
