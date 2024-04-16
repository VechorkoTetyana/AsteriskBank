//
//  ProductDetailsVC.swift
//  AsteriskBank
//
//  Created by Tetyana Vechorko on 16.04.24.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
/*        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }*/
        
        guard let font = UIFont(name: "SpaceGrotesk-Bold", size: 34) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        titleLbl.font = font
//        titleLbl.adjustsFontForContentSizeCategory = true
    }
}
