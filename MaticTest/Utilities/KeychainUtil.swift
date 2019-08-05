//
//  KeychainUtil.swift
//  MaticTest
//
//  Created by Sourav on 30/07/19.
//  Copyright © 2019 matic. All rights reserved.
//

import Foundation
import Security


public class KeychainService: NSObject {
    
    class func saveUserDetails(uname:String, password: String,token:String, completion: @escaping (_ success: Bool, _ message:String?) -> Void) {
        
        _ = deletePassword(service: kSecAttrAuthenticationType as String, account: token)
        
        var status : OSStatus = -1
        var dictionary = passwordQuery(account: uname)
        let userDetail = [uname: password, "token":token]
        
        do {
            let userDetailData = try JSONSerialization.data(withJSONObject: userDetail, options: .prettyPrinted)
            dictionary[kSecValueData as String] = userDetailData
        }
        catch {
            print(error.localizedDescription)
        }
        status = SecItemAdd(dictionary as CFDictionary, nil)
        
        if (status != errSecSuccess) {    // Always check the status
            if let err = SecCopyErrorMessageString(status, nil) {
                
                completion(false,err as String)
            }
        }
        else {
            completion(true, nil)
        }
    }
    
    class func deletePassword(service: String, account: String) -> Bool  {
        
        var status : OSStatus = -1
        if !(service.isEmpty) && !(account.isEmpty)
        {
            let dictionary = passwordQuery(account: account)
            status = SecItemDelete(dictionary as CFDictionary);
        }
        return status == errSecSuccess
    }
    
    class func loadUserDetails(userName:String, completion: @escaping (_ success: Bool, _ detailDic:[String:Any]) -> Void) {
        
        var status : OSStatus = -1
        var passwordData : AnyObject?
        
        var dictionary = passwordQuery(account: userName)
        dictionary[kSecReturnData as String] = kCFBooleanTrue
        dictionary[kSecMatchLimit as String] = kSecMatchLimitOne

        status = SecItemCopyMatching(dictionary as CFDictionary, &passwordData)
        
        if status == errSecSuccess
        {
            if let retrievedData = passwordData as? Data
            {
                let userDetail = (try? JSONSerialization.jsonObject(with: retrievedData, options: [])) as? [String:AnyObject]
                completion(true, userDetail ?? [:])
            }
        }
        else {
            if let err = SecCopyErrorMessageString(status, nil) {
                
                completion(false, ["error":err as String])
                //                Helper.showAlert(title: "Error", subtitle: err as String)
                print("Write failed: \(err)")
            }
        }
    }
    
    class func passwordQuery(account: String) -> Dictionary<String, Any>
    {
        let dictionary = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : account,
            kSecAttrService as String : "matic.MaticTest",
            kSecAttrAccessible as String : kSecAttrAccessibleWhenUnlocked //If need access in background, might want to consider kSecAttrAccessibleAfterFirstUnlock
            ] as [String : Any]
        
        return dictionary
    }
    
}
