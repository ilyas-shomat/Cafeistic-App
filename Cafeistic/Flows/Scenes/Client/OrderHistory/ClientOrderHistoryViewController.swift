//
//  ClientOrderHistoryViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.05.2021.
//  
//

import UIKit

class ClientOrderHistoryViewController: DefaultViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(ClientOrderHistoryCell.self)
        return tableView
    }()
    
    private var historyModel: [ClientOrderHistoryCellModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var presenter: ViewToPresenterClientOrderHistoryProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
        
        //MARK: - Delete code below after integrating with API
        tempfunc()
    }
    
}

extension ClientOrderHistoryViewController: SetupBaseViewController {
    func setupViews() {
        configureSubViews()
        configureConstraints()
    }
    
    func configureSubViews() {
        view.addSubview(tableView)
    }
    
    func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.bottom.equalToSuperview()
        }
    }
    
    func setupActions() {
        
    }
    
}

extension ClientOrderHistoryViewController: TableViewProvider {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as ClientOrderHistoryCell
        cell.viewModel = historyModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.openOrderHistoryItem()
    }
}

// MARK: - (Presenter -> View)
extension ClientOrderHistoryViewController: PresenterToViewClientOrderHistoryProtocol{

}

//MARK: - Delete code below after integrating with API

extension ClientOrderHistoryViewController {
    private func tempfunc() {
        historyModel.append(ClientOrderHistoryCellModel(image:  UIImage(named: "tepm_1_img"), establishmentName: "Шайхана", totalExpense: "7000 тг", date: "12.04.2021"))
        historyModel.append(ClientOrderHistoryCellModel(image:  UIImage(named: "tepm_1_img"), establishmentName: "Шайхана", totalExpense: "7000 тг", date: "12.04.2021"))
        historyModel.append(ClientOrderHistoryCellModel(image:  UIImage(named: "tepm_1_img"), establishmentName: "Шайхана", totalExpense: "7000 тг", date: "12.04.2021"))
    }
}
