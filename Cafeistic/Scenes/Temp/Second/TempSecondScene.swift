//
//  TempSecondScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 20.03.2023.
//

import UIKit

class TempSecondScene: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 20, y: 300, width: 350, height: 50)
        button.backgroundColor = .blue
        button.setTitle("Present TempSecondDetailScene", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    var coordinatorDelegate: SecondCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button)
    }
    
    @objc private func tapButton() {
        coordinatorDelegate?.navigate_From_TempSecondScene_To_TempSecondDetailScene()
    }
}
