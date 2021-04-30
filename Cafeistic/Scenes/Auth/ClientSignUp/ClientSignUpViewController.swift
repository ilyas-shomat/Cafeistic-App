//
//  ClientSignUpViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import UIKit

class ClientSignUpViewController: DefaultViewController {
    
    var presenter: ViewToPresenterClientSignUpProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        
        view.backgroundColor = .yellow
    }
    
}

// MARK: - (Presenter -> View)
extension ClientSignUpViewController: PresenterToViewClientSignUpProtocol{

}
