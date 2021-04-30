//
//  DefaultNavigationController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 29.04.2021.
//

import Foundation
import UIKit

class DefaultNavigationController: UINavigationController {
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
        self.navigationBar.tintColor = UIColor.appOrange
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
}
