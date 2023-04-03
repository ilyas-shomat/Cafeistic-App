//
//  ThirdChild2Scene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.03.2023.
//

import UIKit

class ThirdChild2Scene: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 20, y: 300, width: 350, height: 50)
        button.backgroundColor = .blue
        button.setTitle("Push ThirdChild1DetailScene", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    var coordinatorDelegate: ThirdChild2CoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button)
        title = "ThirdChild2Scene"
    }
    
    @objc private func tapButton() {
//        coordinatorDelegate?.navigateFrom_ThirdChild2Scene_ThirdChild2DetailScene()
        coordinatorDelegate?.finishFlow()
    }
}
