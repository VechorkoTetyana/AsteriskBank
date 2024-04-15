//
//  ProductCategoryViewModel.swift
//  AsteriskBank
//
//  Created by Tetyana Vechorko on 11.04.24.
//

import Foundation

struct ProductCategoryViewModel {
    let title: String
    let products: [ProductViewModel]
    
    init(title: String, products: [ProductViewModel]) {
        self.title = title
        self.products = products
    }
}
