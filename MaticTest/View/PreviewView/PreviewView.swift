//
//  PreviewView.swift
//  MaticTest
//
//  Created by Sourav on 05/08/19.
//  Copyright © 2019 matic. All rights reserved.
//

import UIKit

class PreviewView: UIView {

    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func closeAction(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    func setUpView(currencyDetail:CurrencyDetail) {
        self.detailLabel.text = currencyDetail.name
        
        if let image = UIImage(named: currencyDetail.imageName) {
            self.coinImageView?.image = image
        }
    }
}
