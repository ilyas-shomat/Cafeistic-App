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
        tableView.register(ClientOrderMealCell.self)
        return tableView
    }()
    
    private lazy var bottomView: CurrentOrderAcceptView = {
        let view = CurrentOrderAcceptView()
        view.price = "7300 тг"
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
    }
    
    func configureSubViews() {
        view.addSubviews(tableView,
                         bottomView)
    }
    
    func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.equalToSuperview()
            $0.bottom.equalTo(bottomView.snp.top)
        }
        bottomView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
            $0.height.equalTo(120)
        }
    }
    
    func setupActions() {
        
    }
}

extension ClientCurrentOrderViewController: TableViewProvider {
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
