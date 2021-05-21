//
//  MenuViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 04.05.2021.
//  
//

import UIKit
import SnapKit

class MenuViewController: DefaultViewController {
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 100, height: 30)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryMenuCell.self)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 10

        return collectionView
    }()
    
    private lazy var mealsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 165, height: 155)

        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MealMenuCell.self)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.layer.cornerRadius = 15
        
        return collectionView
    }()
    
    private lazy var menuLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstant.Scenes.Menu.menu
        label.textColor = .appOrange
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.sizeToFit()
        return label
    }()
    
    private lazy var orderCartButton: UIButton = {
        let button = UIButton()
        button.setImage(Assets.orderCart.image, for: .normal)
        button.addTarget(self, action: #selector(tapOrderCartButton), for: .touchUpInside)
        return button
    }()
    
    var presenter: ViewToPresenterMenuProtocol?
    
    private var categoryModels: [CategoryMenuCellModel] = [] {
        didSet {
            categoryCollectionView.reloadData()
        }
    }
    
    private var mealModels: [MealMenuCellModel] = [] {
        didSet {
            mealsCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
        
        //MARK: - Delete code below after integrating with API
        tepmFunc()
    
    }
    
}

extension MenuViewController: CollectionViewProvider {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categoryModels.count
        }
        else {
            return mealModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CategoryMenuCell
            cell.viewModel = categoryModels[indexPath.row]
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as MealMenuCell
            cell.viewModel = mealModels[indexPath.row]
            return cell
        }
    }
    
}

extension MenuViewController: SetupBaseViewController {
    func setupViews() {
        configureSubViews()
        configureConstraints()
        setupNavigationBar()
        setupTabBar()
    }
    
    func configureSubViews() {
        view.addSubviews(categoryCollectionView,
                         mealsCollectionView)
    }
    
    func configureConstraints() {
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(34)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
        }
        mealsCollectionView.snp.makeConstraints {
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    func setupActions() {
        
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: orderCartButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuLabel)
    }
    
    private func setupTabBar() {
        navigationController?.tabBarItem = UITabBarItem(title: "",
                                                        image: Assets.menuUnselectedTabBar.image,
                                                        selectedImage: Assets.menuTabBar.image)
    }
    
    @objc private func tapOrderCartButton() {
        
    }
}

// MARK: - (Presenter -> View)
extension MenuViewController: PresenterToViewMenuProtocol {

}


//MARK: - Delete code below after integrating with API
extension MenuViewController {
    private func tepmFunc() {
        categoryModels.append(CategoryMenuCellModel(isSelected: true, title: "long long text"))
        categoryModels.append(CategoryMenuCellModel(title: "long text"))
        categoryModels.append(CategoryMenuCellModel(title: "long "))
        categoryModels.append(CategoryMenuCellModel(title: "long text"))
        categoryModels.append(CategoryMenuCellModel(title: "long "))
        
        mealModels.append(MealMenuCellModel(name: "Домашний Лагман", price: "250 tg", imageName: "tepm_1_img"))
        mealModels.append(MealMenuCellModel(name: "Домашний Лагман", price: "250 tg", imageName: "tepm_1_img"))
        mealModels.append(MealMenuCellModel(name: "Домашний Лагман", price: "250 tg", imageName: "tepm_1_img"))
        mealModels.append(MealMenuCellModel(name: "Домашний Лагман", price: "250 tg", imageName: "tepm_1_img"))
        mealModels.append(MealMenuCellModel(name: "Домашний Лагман", price: "250 tg", imageName: "tepm_1_img"))
        mealModels.append(MealMenuCellModel(name: "Домашний Лагман", price: "250 tg", imageName: "tepm_1_img"))
        mealModels.append(MealMenuCellModel(name: "Домашний Лагман", price: "250 tg", imageName: "tepm_1_img"))
    }
}
