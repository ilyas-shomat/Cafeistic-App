//
//  TempThirdScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 20.03.2023.
//

import UIKit

class TempThirdScene: UIViewController {
    private lazy var button1: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 100, y: 100, width: 200, height: 50)
        button.backgroundColor = .blue
        button.setTitle("Push Child1", for: .normal)
        button.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 100, y: 400, width: 200, height: 50)
        button.backgroundColor = .blue
        button.setTitle("Present Child 2", for: .normal)
        button.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
        return button
    }()
    
    var coordinatorDelegate: ThirdCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button1)
        view.addSubview(button2)
        
    }
    
    @objc private func tapButton1() {
        coordinatorDelegate?.navigateToThirdChild1()
//        coordinatorDelegate?.navigate_From_TempSecondScene_To_TempSecondDetailScene()
    }
    
    @objc private func tapButton2() {
        
    }
}
