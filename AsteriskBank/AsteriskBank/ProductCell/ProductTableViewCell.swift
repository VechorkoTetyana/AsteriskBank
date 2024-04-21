//
//  ProductTableViewCell.swift
//  AsteriskBank
//
//  Created by Tetyana Vechorko on 27.03.24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var produktImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var separatorView: UIView!

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
    }
    
    func configure(
        viewModel: ProductViewModel
    ) {
        produktImageView.image = UIImage(named: viewModel.imageName)
        titleLbl.text = viewModel.title
        descriptionLbl.text = viewModel.description
        
    }
    
    func setFirst() {
      //  background.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        setCellCornerRadius([.layerMaxXMinYCorner, .layerMinXMinYCorner])

    }
    
    func setLast() {
     //   background.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        setCellCornerRadius([.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        separatorView.isHidden = true
     //   separatorView.alpha = 0
    }
    
    override func prepareForReuse() {
        separatorView.isHidden = false
        background.clipsToBounds = false
    }
    
    private func setCellCornerRadius(_ corners: CACornerMask) {
        background.clipsToBounds = true
        background.layer.cornerRadius = 8
        background.layer.maskedCorners = corners
                
    }
}
