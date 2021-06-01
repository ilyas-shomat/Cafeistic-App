//
//  DefaultNavigationController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 29.04.2021.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    var navigationViewTitle: String?
    
    private var type: DefaultNavigationControllerType
    
    private lazy var navigationView: MainNavigationBarView = {
        let view = MainNavigationBarView(title: navigationViewTitle ?? "")
        return view
    }()
    
    init(type: DefaultNavigationControllerType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if type == .withView {
            setupNavigationBarView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugPrint("\(#function) at \(self)")
    }
    
    func makeNotTranslucent() {
        navigationBar.isTranslucent = false
    }
    
    func removeBorder() {
        navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    private func setupNavigationBar() {
        navigationBar.tintColor = UIColor.appOrange
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    
    private func setupNavigationBarView() {
        navigationBar.addSubview(navigationView)

        navigationView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.equalToSuperview()
            $0.width.equalTo(230)
        }
    }
}
