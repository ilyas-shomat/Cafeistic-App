//
//  TempSignUpScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 15.03.2023.
//

import UIKit

class TempSignUpScene: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 100, y: 300, width: 200, height: 50)
        button.backgroundColor = .blue
        button.setTitle("close the flow", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    var authCoordinatorDelegate: AuthCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button)
        
        title = "SignUpScene"
    }
    
    @objc private func tapButton() {
        authCoordinatorDelegate?.finishFlow()
    }
}
