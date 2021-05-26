//
//  ClientCurrentOrderViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 24.05.2021.
//  
//

import UIKit

class ClientCurrentOrderViewController: DefaultViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(ClientCurrentOrderMealCell.self)
        return tableView
    }()
    
    private lazy var navigationView: MainNavigationBarView = {
        let view = MainNavigationBarView(title: StringConstant.Scenes.ClientCurrentOrder.order)
        return view
    }()
    
    private var mealModel: [ClientCurrentOrderMealCellModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var presenter: ViewToPresenterClientCurrentOrderProtocol?
    
    override func viewDidLoad() {
        
        view.backgroundColor = .red
        super.viewDidLoad()
        presenter?.load()
        setupViews()
        
        //MARK: - Delete code below after integrating with API
        tempFunc()
    }
    
}

extension ClientCurrentOrderViewController: SetupBaseViewController {
    func setupViews() {
//        setupTabBar()
        configureSubViews()
        configureConstraints()
        setupNavigationBarView()
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
    
    private func setupNavigationBarView() {
        navigationController?.navigationBar.addSubview(navigationView)
        navigationView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.equalToSuperview()
            $0.width.equalTo(230)
        }
    }
}

extension ClientCurrentOrderViewController: TableViewProvider {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as ClientCurrentOrderMealCell
        cell.viewModel = mealModel[indexPath.row]
        return cell
    }
    
    
}

// MARK: - (Presenter -> View)
extension ClientCurrentOrderViewController: PresenterToViewClientCurrentOrderProtocol{

}


//MARK: - Delete code below after integrating with API
extension ClientCurrentOrderViewController {
    private func tempFunc() {
        mealModel.append(ClientCurrentOrderMealCellModel(mealName: "Яблочный сок", image: UIImage(named: "tepm_1_img"), description: "1л - 300 тг", count: "1"))
        mealModel.append(ClientCurrentOrderMealCellModel(mealName: "Яблочный сок", image: UIImage(named: "tepm_1_img"), description: "1л - 300 тг", count: "1"))
        mealModel.append(ClientCurrentOrderMealCellModel(mealName: "Яблочный сок", image: UIImage(named: "tepm_1_img"), description: "1л - 300 тг", count: "1"))
        mealModel.append(ClientCurrentOrderMealCellModel(mealName: "Яблочный сок", image: UIImage(named: "tepm_1_img"), description: "1л - 300 тг", count: "1"))
    }
}
