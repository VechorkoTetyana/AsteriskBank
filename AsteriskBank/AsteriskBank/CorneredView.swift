//
//  CorneredView.swift
//  AsteriskBank
//
//  Created by Tetyana Vechorko on 16.04.24.
//

import UIKit

class CorneredView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        layer.cornerRadius = 8
//        clipsToBounds = true
        layer.masksToBounds = true
    }
}
