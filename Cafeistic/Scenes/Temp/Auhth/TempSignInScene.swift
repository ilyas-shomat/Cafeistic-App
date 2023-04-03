//
//  TempSignInScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.03.2023.
//

import UIKit

class TempSignInScene: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 100, y: 300, width: 200, height: 50)
        button.backgroundColor = .blue
        button.setTitle("Navigate To SignUp", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    var coordinatorDelegate: AuthCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button)
        
        title = "SignInScene"
    }
    
    @objc private func tapButton() {
        coordinatorDelegate?.navigateFrom_SignIn_To_SignUp()
    }
}
