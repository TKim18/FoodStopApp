//
//  OrderDatabaseImplementation.swift
//  FoodStopV2
//
//  Created by Tim Kim on 5/30/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import SQLite

let path = NSSearchPathForDirectoriesInDomains(
    .DocumentDirectory, .UserDomainMask, true
    ).first!

let db = try! Connection("\(path)/db.sqlite3")
//let db = try! Connection("orderlist.db.sqlite3")

class OrderDatabaseImplementation{
    
    let orders = Table("orders")
    let id = Expression<Int64>("id")
    let foodService = Expression<String>("foodService")
    let destination = Expression<String>("destination")
    let foodChoice = Expression<String>("foodChoice")
    
    func createOrdersTable(){
        
        try! db.run(orders.create { t in
            t.column(id, primaryKey: .Autoincrement)
            t.column(foodService)
            t.column(destination)
            t.column(foodChoice)
            })
    }
    
    func insertOrder(){
        let insert = orders.insert(foodService <- "Summerfields", destination <- "Butterfields B")
        let rowid = try! db.run(insert)
    }
    
    func selectFromOrders(){
        for order in try! db.prepare(orders){
            print("id: \(order[id]), foodService: \(order[foodService]), destination: \(order[destination])")
        }
    }
    
    
    
}
