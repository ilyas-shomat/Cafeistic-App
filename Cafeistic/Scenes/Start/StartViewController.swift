//
//  StartViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//  
//

import UIKit

class StartViewController: DefaultViewController {
    
    var presenter: ViewToPresenterStartProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
    }
    
}

// MARK: - (Presenter -> View)
extension StartViewController: PresenterToViewStartProtocol{

}
