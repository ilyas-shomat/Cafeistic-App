//
//  Scene.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 02.02.2023.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class Scene: UIViewController {
    var isNavigationBarHidden: Bool { return false }
    var isSafeAreaTopConstrainstActviated: Bool { return true }
    var cancellables: Set<AnyCancellable> = .init()
    
    var navigationBarHeight: CGFloat {
        return navigationController?.navigationBar.bounds.size.height  ?? 0
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = isNavigationBarHidden
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isNavigationBarHidden {
            navigationController?.navigationBar.isHidden = false
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cancellables.removeAll()
    }
    
    func setupView<Content: View>(rootView: Content, backgorundColor: UIColor = .white)  {
        let controller = UIHostingController(rootView: rootView)
        controller.view.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = backgorundColor
        view.addSubview(controller.view)
        
        controller.didMove(toParent: self)
        
        var allConstraints: [NSLayoutConstraint] = [
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
                
        if isSafeAreaTopConstrainstActviated {
            allConstraints.append(controller.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        }
        else {
            allConstraints.append(controller.view.topAnchor.constraint(equalTo: view.topAnchor))
        }

        NSLayoutConstraint.activate(allConstraints)
    }
}

extension Scene {
    func showAlert(title: String = "", message: String = "") {
        let alertController: UIAlertController = .init(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alertController.addAction(.init(title: "Ок", style: .cancel))
        
        present(alertController, animated: true)
    }
}

//extension Scene {
//    var toPresentable: Scene {
//        return self
//    }
//}
