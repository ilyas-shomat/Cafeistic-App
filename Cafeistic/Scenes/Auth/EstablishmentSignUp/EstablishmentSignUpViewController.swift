//
//  EstablishmentSignUpViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import UIKit
import SnapKit



class EstablishmentSignUpViewController: UIViewController {
    
    private var staffRows: [TableViewCellType] = [
        .label(title: StringConstant.Scenes.EstablishmentSignUp.staffSignUp,
               color: .appOrange,
               textFont: UIFont.boldSystemFont(ofSize: 20)),
        .textField(style: .regular,
                   type: .fullname,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.fullName),
        .textField(style: .regular,
                   type: .establishmentId,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establismentId),
        .textField(style: .login,
                   type: .login,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.login),
        .textField(style: .email,
                   type: .email,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.email),
        .textField(style: .password,
                   type: .password,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.password),
        .textField(style: .password,
                   type: .repeatedPassword,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.repeatPassword),
        .button(style: .rounded,
                title: StringConstant.Scenes.EstablishmentSignUp.signUp)
    ]
    
    private var establishmentRows: [TableViewCellType] = [
        .label(title: StringConstant.Scenes.EstablishmentSignUp.establishmentSignUp,
               color: .appOrange,
               textFont: UIFont.boldSystemFont(ofSize: 20)),
        .textField(style: .regular,
                   type: .establismentName,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establishmentName),
        .textField(style: .regular,
                   type: .establishmentCity,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establismentCity),
        .textField(style: .regular,
                   type: .establishmentPhone,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establismentPhone),
        .textField(style: .regular,
                   type: .establismentEmail,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establisnetEmail),
        .button(style: .rounded,
                title: StringConstant.Scenes.EstablishmentSignUp.next)
    ]
    
    private var ownerRows: [TableViewCellType] = [
        .label(title: StringConstant.Scenes.EstablishmentSignUp.ownerSignUp,
               color: .appOrange,
               textFont: UIFont.boldSystemFont(ofSize: 20)),
        .textField(style: .regular,
                   type: .fullname,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.fullName),
        .textField(style: .login,
                   type: .login,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.login),
        .textField(style: .email,
                   type: .email,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.email),
        .textField(style: .password,
                   type: .password,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.password),
        .textField(style: .password,
                   type: .repeatedPassword,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.repeatPassword),
        .button(style: .rounded,
                title: StringConstant.Scenes.EstablishmentSignUp.signUp)
            
    ]
    
    private lazy var switchView: MainSwitchView = {
        let view = MainSwitchView(frame: CGRect(x: 0, y: 0, width: 264, height: 34))
        view.firstOptionText = StringConstant.Scenes.EstablishmentSignUp.staff
        view.secondOptionText = StringConstant.Scenes.EstablishmentSignUp.owner
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    private var textFieldType: [TableViewTextFieldCellType:String] = [:]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.register(TableViewLabelCell.self)
        tableView.register(TableViewTextFieldCell.self)
        tableView.register(TableViewButtonCell.self)
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    var signUpType: SignUpType = .staff {
        didSet {
            tableView.reloadData()
        }
    }
    
    var presenter: ViewToPresenterEstablishmentSignUpProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarSwitchView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        switchView.removeFromSuperview()
    }
    
}

extension EstablishmentSignUpViewController: SetupBaseViewController {
    
    func setupViews() {
        configureSubViews()
        configureConstraints()
    }

    func configureSubViews() {
        view.addSubview(tableView)
    }
    
    func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(-20)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setupActions() {
        
    }
    
    private func setupNavigationBarSwitchView() {
        navigationController?.navigationBar.addSubview(switchView)
        switchView.snp.makeConstraints {
            $0.width.equalTo(264)
            $0.height.equalTo(34)
            $0.center.equalToSuperview()
        }
    }
}

extension EstablishmentSignUpViewController: TableViewProvider {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch signUpType {
        case .staff:
            return staffRows.count
        case .establishment:
            return establishmentRows.count
        case .owner:
            return ownerRows.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var rows = [TableViewCellType]()

        switch signUpType {
        case .staff:
            rows = staffRows
        case .establishment:
            rows = establishmentRows
        case .owner:
            rows = ownerRows
        }
        
        return rows[indexPath.row].cell(tableView: tableView, indexPath: indexPath, delegate: self)
    }
}

// MARK: - (Presenter -> View)
extension EstablishmentSignUpViewController: PresenterToViewEstablishmentSignUpProtocol {

}

extension EstablishmentSignUpViewController: MainSwitchViewDelegate {
    func didSelect(option: Int) {
        if option == 0 {
            signUpType = .staff
        }
        else {
            signUpType = .establishment
        }
    }
}

extension EstablishmentSignUpViewController: TableViewButtonCellDelegate {
    func tapButtonAction() {
        switch signUpType {
        case .establishment:
            signUpType = .owner
        case .staff:
            consolePrint(textFieldType)
        case .owner:
            consolePrint(textFieldType)
        }
    }
}

extension EstablishmentSignUpViewController: TableViewTextFieldCellDelegate {
    
    func textFieldDidChange(value: String, type: TableViewTextFieldCellType) {
        switch type {
        case .fullname:
            textFieldType[.fullname] = value
        case .establishmentId:
            textFieldType[.establishmentId] = value
        case .login:
            textFieldType[.login] = value
        case .email:
            textFieldType[.email] = value
        case .password:
            textFieldType[.password] = value
        case .repeatedPassword:
            textFieldType[.repeatedPassword] = value
        case .establismentName:
            textFieldType[.establismentName] = value
        case .establishmentCity:
            textFieldType[.establishmentCity] = value
        case .establishmentPhone:
            textFieldType[.establishmentPhone] = value
        case .establismentEmail:
            textFieldType[.establismentEmail] = value
        default:
            return
        }
    }
}
