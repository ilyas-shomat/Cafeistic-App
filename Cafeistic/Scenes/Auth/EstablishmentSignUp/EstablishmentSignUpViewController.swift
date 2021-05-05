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
    
    private lazy var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Персонал", "Владелец"])
        segmentControl.selectedSegmentTintColor = .white
        segmentControl.backgroundColor = .appOrange
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.appOrange], for: .normal)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.setWidth(view.frame.width * 0.35, forSegmentAt: 0)
        segmentControl.setWidth(view.frame.width * 0.35, forSegmentAt: 1)
        segmentControl.layer.cornerRadius = segmentControl.bounds.height / 2
        return segmentControl
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
        navigationItem.titleView = segmentControl
        
//        configureBaseSubViews()
//        configureBaseConstraints()
    }
    
    func configureBaseSubViews() {
//        view.addSubviews(segmentControl)
    }
    
    func configureBaseConstraints() {
    }
    
    func setupStaffViews(signUpType: SignUpType) {
    }
    
    func setupEstablishmentViews() {
        
    }
    
    func setupActions() {
        
    }
}

// MARK: - (Presenter -> View)
extension EstablishmentSignUpViewController: PresenterToViewEstablishmentSignUpProtocol{

}
