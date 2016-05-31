//
//  FoodStopV2Tests.swift
//  FoodStopV2Tests
//
//  Created by Tim Kim on 5/30/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import XCTest
import FoodStopV2

class FoodStopV2Tests: XCTestCase {

    func testOrderInitialization(){
        // Success case.
        let potentialItem = Order(foodService: "Summerfields", destination: "Butterfields C", foodChoice: "Burger 1")
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Order(foodService: "", destination: "Hi", foodChoice: "0")
        XCTAssertNil(noName, "Empty name is invalid")
    }
    

}