//
//  ViewController.swift
//  AsteriskBank
//
//  Created by Tetyana Vechorko on 26.03.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
//    let produktCategories: [String] = ["Debit", "Deposit", "Credit", "Loan"]

    private var categories: [ProductCategoryViewModel] = []
    private var currentCategoryIndex: Int = 0
    private var currentCategory: ProductCategoryViewModel {
        return categories[currentCategoryIndex]
        
    }
    
    private var loader = ProductsLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = provideCategories()
        
        configureTableView()
        configureSegmentedControl()
    }
    func configureSegmentedControl() {
        segmentedControl.removeAllSegments()
        
        for (index, category) in categories.enumerated() {
            segmentedControl.insertSegment(
                withTitle: category.title,
                at: index,
                animated: false)
        }
        segmentedControl.selectedSegmentIndex = 0
    }
    func configureTableView () {
        tableView.separatorColor = .clear
        tableView.dataSource = self
 //     tableView.delegate = self
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        
    }
    
    func provideCategories() -> [ProductCategoryViewModel] {
        let products = loader.load()
        
        var categories: [String: [ProductViewModel]] = [:]
        
        for product in products {
            if categories [product.category] == nil {
                categories[product.category] = []
            }
            categories[product.category]?.append(product)
        }
        
        var result = [ProductCategoryViewModel] ()
        
        for (categoryKey, products) in categories {
            result.append(ProductCategoryViewModel(
                title: categoryKey.capitalized,
                products: products
            ))
        }
        
        return result
    }
}

extension ViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //       return debitProducts.count
        return currentCategory.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell {
            
  //          let products = currentCategory.products
            
            let product = currentCategory.products[indexPath.row]
            cell.configure(viewModel: product)
            
            if indexPath.row == 0 {
                cell.setFirst()
            }
            
            if indexPath.row == currentCategory.products.count - 1 {
                cell.setLast()
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}

//extension ViewController: UITableViewDelegate {
//   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       return 82
//   }
//}
