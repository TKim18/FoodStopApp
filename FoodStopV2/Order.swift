//
//  File.swift
//  FoodStopV2
//
//  Created by Tim Kim on 5/30/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import UIKit

public class Order {
    var foodService: String
    var destination: String
    var foodChoice: String
    
    init?(foodService: String, destination: String, foodChoice: String){
        self.foodService = foodService
        self.destination = destination
        self.foodChoice = foodChoice
        
        if foodService.isEmpty || destination.isEmpty || foodChoice.isEmpty{
            return nil
        }
    }
}
