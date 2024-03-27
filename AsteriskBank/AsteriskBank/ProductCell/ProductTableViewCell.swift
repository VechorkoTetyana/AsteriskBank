//
//  ProductTableViewCell.swift
//  AsteriskBank
//
//  Created by Tetyana Vechorko on 27.03.24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var produktImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(
        viewModel: ProductViewModel
    ) {
        produktImageView.image = UIImage(named: viewModel.imageName)
        titleLbl.text = viewModel.title
        descriptionLbl.text = viewModel.description
        
    }
    
//    override class func awakeFromNib() {}
}
