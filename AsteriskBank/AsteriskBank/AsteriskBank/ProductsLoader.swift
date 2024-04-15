//
//  ProductsLoader.swift
//  AsteriskBank
//
//  Created by Tetyana Vechorko on 01.04.24.
//

import Foundation

class ProductsLoader {
    func load() -> [ProductViewModel] {
        
        guard let path = Bundle.main.path(forResource: "products", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
              let products = try? JSONDecoder().decode([ProductViewModel].self, from: data)
        else { return [] }
        
        return products
        
        }
    }
