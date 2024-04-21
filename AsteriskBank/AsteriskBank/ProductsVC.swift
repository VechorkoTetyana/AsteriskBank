//
//  ViewController.swift
//  AsteriskBank
//
//  Created by Tetyana Vechorko on 26.03.24.
//

import UIKit




class ProductsVC: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
//    let produktCategories: [String] = ["Debit", "Deposit", "Credit", "Loan"]

    private var categories: [ProductCategoryViewModel] = []
    private var currentCategoryIndex: Int = 0
    
    private var currentCategory: ProductCategoryViewModel {
        categories[currentCategoryIndex]
    }
   /* var currentCategory: ProductCategoryViewModel? {
        guard currentCategoryIndex < categories.count else {return nil}
        return categories[currentCategoryIndex]
        
    }
    */
    
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
        
        segmentedControl.addTarget(self, action: #selector(onSegmentControlIndexChanged), for: .valueChanged)
    }
    
    @objc
    private func onSegmentControlIndexChanged() {
        currentCategoryIndex = segmentedControl.selectedSegmentIndex
        tableView.reloadData()
    }
    
    func configureTableView () {
        tableView.separatorColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
                
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        
    }
    
   private func provideCategories() -> [ProductCategoryViewModel] {
        let products = loader.load()
        
        let productCategories: [String] = ["Debit", "Deposit", "Credit", "Loan"]
       
/*        let result = produktCategories.map { string in
           Category(title:string)
           
       }*/
        
        var categories: [String: [ProductViewModel]] = [:]
        
        for category in productCategories {
            categories[category] = []
        }
        
        for product in products {
        /*      if categories [product.category] == nil {
                categories[product.category] = []
            }*/
//          let title = product.category.capitalized
            
            categories[product.categoryTitle]?.append(product)
        }
        
/*        var result = [ProductCategoryViewModel] ()
        
        for (categoryKey, products) in categories {
            result.append(ProductCategoryViewModel(
                title: categoryKey,
                products: products
            ))
        }*/
        
       return productCategories.compactMap {
//         categories[$0].products
           guard let products = categories[$0] else { return nil }
           return ProductCategoryViewModel(title: $0, products: products)
       }
    }
}

extension ProductsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 //       return debitProducts.count
 //PHIL   return currentCategory?.products.count ?? 0
        return currentCategory.products.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 //PHIL       guard let currentCategory else { return UITableViewCell() }
        
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

extension ProductsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let product = currentCategory.products[indexPath.row]
        presentDetails()
    }
    private func presentDetails() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(identifier: "ProductDetailsVC")

//        detailsVC.modalPresentationStyle = .fullScreen
//        detailsVC.modalTransitionStyle = .crossDissolve
        
        
//        secondVC.modalPresentationStyle = .fullScreen
//        secondVC.modalTransitionStyle = .crossDissolve
                
        
        show(detailsVC, sender: self)
    }
}

//extension ViewController: UITableViewDelegate {
//   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       return 82
//   }
//}
