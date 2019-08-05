//
//  CoinDetailTableViewCell.swift
//  MaticTest
//
//  Created by Sourav on 05/08/19.
//  Copyright © 2019 matic. All rights reserved.
//

import UIKit

protocol CoinDetailTableViewCellDelegate:class {
    func didForceTouch(cell:UITableViewCell, currencyDetail:CurrencyDetail)
    func didHideTouch(cell:UITableViewCell, currencyDetail:CurrencyDetail)
}

class CoinDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    weak var delegate:CoinDetailTableViewCellDelegate?
    
    var currencyDetail:CurrencyDetail!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(currencyDetail:CurrencyDetail) {
        self.currencyDetail = currencyDetail
        
        self.detailLabel.text = currencyDetail.name
        if let image = UIImage(named: currencyDetail.imageName) {
            self.coinImageView?.image = image
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.force >= touch.maximumPossibleForce {
                print("Show view")
                delegate?.didForceTouch(cell: self, currencyDetail: self.currencyDetail)
                //                forceLabel.text = "385+ grams"
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("hide view")
        delegate?.didHideTouch(cell: self, currencyDetail: self.currencyDetail)
    }
    
}
