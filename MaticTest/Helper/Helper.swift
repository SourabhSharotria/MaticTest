//
//  Helper.swift
//  MaticTest
//
//  Created by Sourav on 30/07/19.
//  Copyright © 2019 mac min . All rights reserved.
//
import Foundation
import UIKit

class Helper{
    static func showAlert(title:String, subtitle:String?){
        DispatchQueue.main.async(execute: {
            let alert = UIAlertController(title: title, message: subtitle, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window!.rootViewController?.present(alert, animated: true, completion: nil)
        })
    }
    
    static func showImageAlert(title:String, subtitle:String?, imageName:String){
        DispatchQueue.main.async(execute: {
            let alert = UIAlertController(title: title, message: subtitle, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            
            let imageView = UIImageView(frame: CGRect(x: 20, y: 10, width: 40, height: 40))
            imageView.image = UIImage(named: imageName)
            
            alert.view.addSubview(imageView)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window!.rootViewController?.present(alert, animated: true, completion: nil)
        })
    }
}
