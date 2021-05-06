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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarSwitchView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        switchView.removeFromSuperview()
        
    }
    
}

extension EstablishmentSignUpViewController {
    
    func setupViews() {
        configureBaseSubViews()
        configureBaseConstraints()
    }
    
    func configureBaseSubViews() {
    }
    
    func configureBaseConstraints() {

    }
    
    func setupStaffViews(signUpType: SignUpType) {
    }
    
    func setupEstablishmentViews() {
        
    }
    
    func setupActions() {
        
    }
    
    private func setupNavigationBarSwitchView() {
        navigationController?.navigationBar.addSubview(switchView)
        switchView.snp.makeConstraints {
            $0.width.equalTo(264)
            $0.height.equalTo(34)
            $0.center.equalToSuperview()
        }
    }
    
}

// MARK: - (Presenter -> View)
extension EstablishmentSignUpViewController: PresenterToViewEstablishmentSignUpProtocol {

}

extension EstablishmentSignUpViewController: MainSwitchViewDelegate {
    func didSelect(option: Int) {
    }
}
