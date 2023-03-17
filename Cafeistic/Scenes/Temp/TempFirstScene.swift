//
//  TempFirstScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 17.03.2023.
//

import UIKit

class TempFirstScene: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 100, y: 300, width: 200, height: 50)
        button.backgroundColor = .blue
        button.setTitle("Setup it later on", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    var coordinatorDelegate: CustomerMainCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button)
        
        title = "TempFirstScene"
    }
    
    @objc private func tapButton() {
//        coordinatorDelegate?.navigateFromSignInToSignUp()
    }
}
