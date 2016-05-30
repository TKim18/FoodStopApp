//
//  OrderDatabaseImplementation.swift
//  FoodStopV2
//
//  Created by Tim Kim on 5/30/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import SQLite

let db = try! Connection("orderlist.db.sqlite3")

let orders = Table("orders")
let id = Expression<Int64>("id")
let foodService = Expression<String>("foodService")
let destination = Expression<String>("destination")
let foodChoice = Expression<String>("foodChoice")