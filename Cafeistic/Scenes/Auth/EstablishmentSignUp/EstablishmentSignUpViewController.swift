//
//  EstablishmentSignUpViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import UIKit
import SnapKit

class EstablishmentSignUpViewController: DefaultViewController {
    
    private var staffRows: [TableViewCellType] = [
        .label(title: StringConstant.Scenes.EstablishmentSignUp.staffSignUp,
               color: .appOrange,
               textFont: UIFont.boldSystemFont(ofSize: 20)),
        .textField(style: .regular,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.fullName),
        .textField(style: .regular,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establismentId),
        .textField(style: .login,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.login),
        .textField(style: .email,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.email),
        .textField(style: .password,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.password),
        .textField(style: .password,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.repeatPassword),
        .button(style: .rounded,
                title: StringConstant.Scenes.EstablishmentSignUp.signUp)
    ]
    
    private var establishmentRows: [TableViewCellType] = [
        .label(title: StringConstant.Scenes.EstablishmentSignUp.establishmentSignUp,
               color: .appOrange,
               textFont: UIFont.boldSystemFont(ofSize: 20)),
        .textField(style: .regular,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establishmentName),
        .textField(style: .regular,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establismentCity),
        .textField(style: .regular,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establismentPhone),
        .textField(style: .regular,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.establisnetEmail),
        .button(style: .rounded,
                title: StringConstant.Scenes.EstablishmentSignUp.next)
    ]
    
    private var ownerRows: [TableViewCellType] = [
        .label(title: StringConstant.Scenes.EstablishmentSignUp.ownerSignUp,
               color: .appOrange,
               textFont: UIFont.boldSystemFont(ofSize: 20)),
        .textField(style: .regular,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.fullName),
        .textField(style: .login,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.login),
        .textField(style: .email,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.email),
        .textField(style: .password,
                   placeholder: StringConstant.Scenes.EstablishmentSignUp.password),
        .textField(style: .password,
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

//        switch rows[indexPath.row] {
//        case .label(let title, let color, let textFont):
//            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as TableViewLabelCell
//            cell.title = title
//            cell.color = color
//            cell.textFont = textFont
//            return cell
//        default:
//            return rows[indexPath.row].cell(tableView: tableView, indexPath: indexPath)
//        }
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
            print("do some")
        case .owner:
            print("do some")
        }
    }
}
