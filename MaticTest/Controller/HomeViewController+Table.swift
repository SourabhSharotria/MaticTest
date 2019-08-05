//
//  HomeViewController+Table.swift
//  MaticTest
//
//  Created by Sourav on 30/07/19.
//  Copyright © 2019 matic. All rights reserved.
//

import Foundation
import UIKit

struct CurrencyDetail {
    let name : String!
    let imageName : String!
    
    init(name : String, imageName : String) {
        self.name = name
        self.imageName = imageName
    }
    
}

extension HomeViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CoinDetailTableViewCell else {
            fatalError("No cell found for indexPath: \(indexPath)")
        }
        cell.setUpCell(currencyDetail: currencyDetailArray[indexPath.row])
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}
