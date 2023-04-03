//
//  FirstScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 17.03.2023.
//

import UIKit

class FirstScene: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 20, y: 300, width: 350, height: 50)
        button.backgroundColor = .blue
        button.setTitle("Push TempFirstDetailScene", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    var coordinatorDelegate: FirstCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button)
    }
    
    @objc private func tapButton() {
        coordinatorDelegate?.navigateFrom_TempFirstScene_To_TempFirstDetailScene()
    }
}
