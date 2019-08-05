//
//  EncryptionUtil.swift
//  MaticTest
//
//  Created by Sourav on 31/07/19.
//  Copyright © 2019 matic. All rights reserved.
//

import Foundation

let iv = AES256.randomIv()
let salt = AES256.randomSalt()

func encryptKey(userDetail:String)->String {
    
    do {
        let randomHash = randomString(length: 20).data(using: .utf8)!
        
        let key = try AES256.createKey(password: randomHash, salt: salt)
        
        let aes = try AES256(key: key, iv: iv)
        let encrypted = try aes.encrypt(userDetail.data(using: .utf8)!)
                
        return encrypted.hexString
    } catch {
        print("Failed")
        print(error)
    }
    
    return ""
}

func decryptKey(key:String, userDetail:String)->String {
    
    do {
        
        let key = key.data(using: .utf8)
        print(key!.hexString)
        let aes = try AES256(key: key!, iv: iv)
        
        let encrypted = try aes.encrypt(userDetail.data(using: .utf8)!)
        
        let decrypted = try aes.decrypt(encrypted)
        
        return decrypted.hexString
        
    } catch {
        print("Failed")
        print(error)
    }
    
    return ""
}

func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}
