//
//  ProductsLoader.swift
//  AsteriskBank
//
//  Created by Tetyana Vechorko on 01.04.24.
//

import Foundation

class ProductsLoader {
    func load() -> [ProductViewModel] {
        
 /*       let string: String? = ""
        if let string {
            print(string)
        }
  */
        guard let path = Bundle.main.path(forResource: "products", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
              let products = try? JSONDecoder().decode([ProductViewModel].self, from: data)
        else { return [] }
        
        return products
        
       /*
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {
                            // do stuff
                  }
              } catch {
                   // handle error
              }
        */
            
        }
    }
