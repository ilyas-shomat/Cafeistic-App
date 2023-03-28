//
//  TempSecondDetailScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 20.03.2023.
//

import UIKit

class TempSecondDetailScene: UIViewController {
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 100, y: 400, width: 200, height: 50)
        button.backgroundColor = .blue
        button.setTitle("dismiss itself", for: .normal)
        button.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
        return button
    }()
    
    var coordinatorDelegate: SecondCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button2)
        
        title = "TempSecondDetailScene"
        }
    
    @objc private func tapButton2() {
        coordinatorDelegate?.dismiss_From_TempSecondDetailScene_To_TempSecondScene()
    }
}
