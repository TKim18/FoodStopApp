//
//  OrderParseAPI.swift
//  FoodStopV2
//
//  Created by Tim Kim on 6/15/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import Foundation
import Parse

extension Order{
    //INSERT INTO Orders WHERE (foodService = fS, destination = dest, foodChoice = fC)
    /*
    func insertOrder(fS : String, dest : String, fC : String){
        let currOrder = PFObject(className: "Order")
        currOrder["foodService"] = fS
        currOrder["destination"] = dest
        currOrder["foodChoice"] = fC
        currOrder.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Order has been saved.")
        }
    }
    */
    func insertOrder(){
        let currOrder = PFObject(className: "Order")
        currOrder["foodService"] = self.foodService
        currOrder["destination"] = self.destination
        currOrder["foodChoice"] = self.foodChoice
        currOrder.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("Order Uploaded")
            } else {
                print("Error: \(error)")
            }
        }
    }

    //SELECT * FROM Orders WHERE (foodService = fS, destination = dest, foodChoice = fC) LIMIT 1
    func getOrder(fS : String, dest : String, fC : String) -> PFObject?{
        let query = PFQuery(className: "Order")
        var result : [PFObject]?
        query.whereKey("foodService", equalTo: fS)
        query.whereKey("destination", equalTo: dest)
        query.whereKey("foodChoice", equalTo: fC)
        query.findObjectsInBackgroundWithBlock{ (objects,error) -> Void in
            if error == nil{
                result = objects
                print("Successfully retrieved: \(objects)")
            }
            else {
                print("Error: \(error)")
            }
        }
        return result!.first
    }
    
    func getAttribute(object : PFObject?, attr : String) -> String{
        return object![attr] as! String
    }
}