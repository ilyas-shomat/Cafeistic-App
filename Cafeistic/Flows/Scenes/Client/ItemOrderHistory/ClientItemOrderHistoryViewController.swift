//
//  ClientItemOrderHistoryViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 27.05.2021.
//  
//

import UIKit

class ClientItemOrderHistoryViewController: DefaultViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(ClientOrderMealCell.self)
        return tableView
    }()
    
    private var mealModel: [ClientCurrentOrderMealCellModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var presenter: ViewToPresenterClientItemOrderHistoryProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
        
        
        //MARK: - Delete code below after integrating with API
        tempFunc()
    }
    
}

extension ClientItemOrderHistoryViewController: SetupBaseViewController {
    func setupViews() {
        configureSubViews()
        configureConstraints()
        configureNavigationBar()
    }
    
    func configureSubViews() {
        view.addSubviews(tableView)
    }
    
    func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func setupActions() {
        
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar
    }
    
}

extension ClientItemOrderHistoryViewController: TableViewProvider {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as ClientOrderMealCell
        cell.viewModel = mealModel[indexPath.row]
        return cell
    }
}

// MARK: - (Presenter -> View)
extension ClientItemOrderHistoryViewController: PresenterToViewClientItemOrderHistoryProtocol{

}


//MARK: - Delete code below after integrating with API
extension ClientItemOrderHistoryViewController {
    private func tempFunc() {
        mealModel.append(ClientCurrentOrderMealCellModel(mealName: "Яблочный сок", image: UIImage(named: "tepm_1_img"), description: "1л - 300 тг", count: "1"))
        mealModel.append(ClientCurrentOrderMealCellModel(mealName: "Яблочный сок", image: UIImage(named: "tepm_1_img"), description: "1л - 300 тг", count: "1"))
        mealModel.append(ClientCurrentOrderMealCellModel(mealName: "Яблочный сок", image: UIImage(named: "tepm_1_img"), description: "1л - 300 тг", count: "1"))
        mealModel.append(ClientCurrentOrderMealCellModel(mealName: "Яблочный сок", image: UIImage(named: "tepm_1_img"), description: "1л - 300 тг", count: "1"))
    }
}
