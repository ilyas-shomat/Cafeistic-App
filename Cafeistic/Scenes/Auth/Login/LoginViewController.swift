//
//  LoginViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//  
//

import UIKit

class LoginViewController: DefaultViewController {
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 100, y: 100, width: 30, height: 100))
        textField.text = "mlksanjbdjn"
        return textField
    }()
    
    var presenter: ViewToPresenterLoginProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupUI()
        setupActions()
        
//        view.backgroundColor = .white
    }
    
}

extension LoginViewController: SetupBaseViewController {
    func setupUI() {
        view.addSubview(loginTextField)
    }
    
    func setupActions() {
        
    }
}

// MARK: - (Presenter -> View)
extension LoginViewController: PresenterToViewLoginProtocol{

}
