//
//  UserDetailModel.swift
//  MaticTest
//
//  Created by Sourav on 04/08/19.
//  Copyright © 2019 matic. All rights reserved.
//

import Foundation

class UserDetail  {
    
    var username = ""
    var userKey = ""
    
    static let sharedInstance = UserDetail()
    
    func updateUserDetail(username:String, userKey:String) {
        self.username = username
        self.userKey = userKey
    }
}
