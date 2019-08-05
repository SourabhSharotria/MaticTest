//
//  HomeViewController.swift
//  MaticTest
//
//  Created by Sourav on 30/07/19.
//  Copyright © 2019 matic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var currencyTableView: UITableView!
    var currencyDetailArray = [CurrencyDetail]()
    var previewView:PreviewView!
    
    let tempDetail = [("$pac","$pac"), ("0xbtc","0xbtc"), ("2give","2give"), ("abt","abt"),
                          ("act","act"), ("actn","actn"), ("ada","ada"), ("add","add"),
                          ("adx","adx"), ("ae","ae"), ("aeon","aeon"), ("aeur","aeur"),
                          ("agi","agi"), ("agrs","agrs"), ("aion","aion"), ("amb","amb"),
                          ("amp","amp"), ("ant","ant"), ("apex","apex"), ("appc","appc")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for detailObj in tempDetail {
            currencyDetailArray.append(CurrencyDetail(name: detailObj.0, imageName: detailObj.1))
        }
        
        self.registerCell()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.currencyTableView.reloadData()
    }
    
    private func registerCell() {
        currencyTableView.register(UINib(nibName: "CoinDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func addPreviewView(currencyDetail:CurrencyDetail){
        
        if (previewView == nil) {
            previewView = Bundle.main.loadNibNamed("PreviewView",
                                                   owner: nil,
                                                   options: nil)?.first as? PreviewView
        }
        
        
        previewView.setUpView(currencyDetail: currencyDetail)
        self.view.addSubview(previewView!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func showHashClicked(_ sender: Any) {
        KeychainService.loadUserDetails(userName: UserDetail.sharedInstance.username) { (success, userDetails) in
            if !success {
                Helper.showAlert(title: "Error", subtitle: userDetails["error"] as? String)
                return
            }
            
            let decryptedkey = decryptKey(key: userDetails["token"] as! String, userDetail: UserDetail.sharedInstance.userKey)
            
            Helper.showAlert(title: "Decrypted Key", subtitle: decryptedkey)
        }
    }
}

extension HomeViewController:CoinDetailTableViewCellDelegate {
    func didForceTouch(cell:UITableViewCell, currencyDetail:CurrencyDetail){
        self.addPreviewView(currencyDetail: currencyDetail)
    }
    
    func didHideTouch(cell:UITableViewCell, currencyDetail:CurrencyDetail){
        
    }
}
