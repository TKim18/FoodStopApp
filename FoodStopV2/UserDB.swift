//
//  File.swift
//  FoodStopV2
//
//  Created by Tim Kim on 6/15/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import Foundation
import Parse

class UserDB {
    
    func insertUser(regUser: String, regEmail: String, regPassword: String){
        let user = PFUser()
        user.username = regUser
        user.password = regPassword
        user.email = regEmail
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?)  -> Void in
            if success {
                print("User Uploaded")
            } else {
                print("Error: \(error)")
            }
        }
    }
}
