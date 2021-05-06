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
    
//    private lazy var segmentedControlView: UIView = {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 264, height: 34))
//        view.layer.cornerRadius = 10
//        view.backgroundColor = .appOrange
//        return view
//    }()
//
//    private lazy var segmentedControl: UISegmentedControl = {
//        let segmentedControl = UISegmentedControl(items: [StringConstant.Scenes.EstablishmentSignUp.staff,
//                                                        StringConstant.Scenes.EstablishmentSignUp.owner])
//        segmentedControl.selectedSegmentTintColor = .white
//        segmentedControl.backgroundColor = .clear
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.appOrange], for: .selected)
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
//        segmentedControl.selectedSegmentIndex = 0
//        segmentedControl.setWidth(view.frame.width * 0.35, forSegmentAt: 0)
//        segmentedControl.setWidth(view.frame.width * 0.35, forSegmentAt: 1)
//
//        segment
//
//        return segmentedControl
//    }()
    
    private lazy var switchView: MainSwitchView = {
        let view = MainSwitchView(frame: CGRect(x: 0, y: 0, width: 264, height: 34))
        view.firstOptionText = StringConstant.Scenes.EstablishmentSignUp.staff
        view.secondOptionText = StringConstant.Scenes.EstablishmentSignUp.owner
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
//    private lazy var switchView: UIView = {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 264, height: 34))
//        view.backgroundColor = .yellow
//        return view
//    }()
    
    var presenter: ViewToPresenterEstablishmentSignUpProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
    }
    
}

extension EstablishmentSignUpViewController {
    
    func setupViews() {
        
//        segmentedControlView.addSubview(segmentedControl)
//
//        navigationItem.titleView = segmentedControlView
        
        navigationController?.navigationBar.backgroundColor = .blue
//        navigationItem.titleView = switchView
        
        configureBaseSubViews()
        configureBaseConstraints()
    }
    
    func configureBaseSubViews() {
//        view.addSubviews(segmentControl)
        view.addSubviews(switchView)
    }
    
    func configureBaseConstraints() {
        switchView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalTo(264)
            $0.height.equalTo(34)
            $0.centerX.equalToSuperview()
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
