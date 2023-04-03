//
//  FirstDetailScene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 20.03.2023.
//

import Foundation
import UIKit

class FirstDetailScene: UIViewController {
    private lazy var button1: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 100, y: 100, width: 200, height: 50)
        button.backgroundColor = .blue
        button.setTitle("open itself", for: .normal)
        button.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 100, y: 400, width: 200, height: 50)
        button.backgroundColor = .blue
        button.setTitle("pop itself", for: .normal)
        button.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
        return button
    }()
    
    var coordinatorDelegate: FirstCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(button1)
        view.addSubview(button2)

        
        title = "TempFirstDetailScene"
    }
    
    @objc private func tapButton1() {
        coordinatorDelegate?.navigateFrom_TempFirstScene_To_Itself()
    }
    
    @objc private func tapButton2() {
        coordinatorDelegate?.popFrom_TempFristDetailScene_To_TempFirstScene()
    }
}
