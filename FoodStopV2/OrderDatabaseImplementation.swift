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
        do {
            try db.run(orders.create { t in
                t.column(id, primaryKey: .Autoincrement)
                t.column(foodService)
                t.column(destination)
                t.column(foodChoice)
                })
            print("Successfully created table")
        } catch {
            print("Database creation failed: \(error)")
        }
    }
    
    func apiFilter(curr_id: Int64) -> Table {
        let order = orders.filter(id == curr_id)
        return order
    }
    
    func insertOrder(fS: String, dest: String, fC: String) -> Int64{
        let insert = orders.insert(foodService <- fS, destination <- dest, foodChoice <- fC)
        var row: Int64 = 0
        do {
            let rowid = try db.run(insert)
            row = rowid
            print("inserted id: \(rowid)")
        } catch {
            print("insertion failed: \(error)")
        }
        return row
    }
    
    func selectAllOrders() -> String{
        var temp: String = ""
        for order in try! db.prepare(orders){
            let curr = "id: \(order[id]), foodService: \(order[foodService]), destination: \(order[destination]), foodChoice: \(order[foodChoice])"
            temp += curr + "\n"
            print(curr)
        }
        return temp
    }
    
    func selectOneOrder(curr_id: Int64) -> String{
        let order = orders.filter(id == curr_id)
        if (db.scalar(order.count) > 0){
            let curr = try db.pluck(order)![destination]
            return curr
        }
        else{
            print("error: nothing in the table")
            return "error"
        }
        //jun 9th thurs 1-3
        //1606017660536
        //855 - 817 - 7973
    }
    
    //use more as template
    func updateOrder(curr_id: Int64, newValue: String){
        let order = orders.filter(id == curr_id)
        do {
            if try db.run(order.update(destination <- newValue)) > 0 {
                print("updated this: \(curr_id)")
            } else {
                print("id not found")
            }
        } catch {
            print("update failed: \(error)")
        }
    }
    
    func deleteAllOrders(){
        try! db.run(orders.delete())
    }
    // DELETE FROM "users"
    
    func deleteOneOrder(curr_id: Int64){
        let order = orders.filter(id == curr_id)
        do {
            if try db.run(order.delete()) > 0{
                print("deleted this: \(curr_id)")
            } else {
                print("id not found")
            }
        } catch {
            print("delete failed: \(error)")
        }
        // DELETE FROM "users" WHERE ("id" = 1)
    }
    
    
    
    
}
