//
//  DeliverDatabaseImplementation.swift
//  FoodStopV2
//
//  Created by Tim Kim on 6/1/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import SQLite

class DeliverDatabaseImplementation{
    
    let deliveries = Table("deliveries")
    let id = Expression<Int64>("id")
    let foodService = Expression<String>("foodService")
    let destination = Expression<String>("destination")
    
    // CREATE TABLE "deliveries" (
    //     "id" INTEGER PRIMARY KEY NOT NULL,
    //     "foodService" TEXT,
    //     "destination" TEXT
    // )
    func createDeliveriesTable(){
        do {
            try db.run(deliveries.create { t in
                t.column(id, primaryKey: .Autoincrement)
                t.column(foodService)
                t.column(destination)
                })
            print("Successfully created table")
        } catch {
            print("Database creation failed: \(error)")
        }
    }
    
    // SELECT * FROM deliveries WHERE id = curr_id
    func apiFilter(curr_id: Int64) -> Table {
        let delivery = deliveries.filter(id == curr_id)
        return delivery
    }
    
    // INSERT INTO "deliveries" ("foodService", "destination") VALUES ('fS','dest')
    func insertDelivery(fS: String, dest: String) -> Int64{
        let insert = deliveries.insert(foodService <- fS, destination <- dest)
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
    
    // SELECT * FROM "deliveries"
    func selectAllDeliveries() -> String{
        var temp: String = ""
        for delivery in try! db.prepare(deliveries){
            let curr = "id: \(delivery[id]), foodService: \(delivery[foodService]), destination: \(delivery[destination])"
            temp += curr + "\n"
            print(curr)
        }
        return temp
    }
    
    // SELECT destination FROM deliveries WHERE id = curr_id
    func selectDestinationFromOneDelivery(curr_id: Int64) -> String{
        let delivery = apiFilter(curr_id)
        if (db.scalar(delivery.count) > 0){
            let curr = try db.pluck(delivery)![destination]
            return curr
        }
        else{
            print("error: nothing in the table")
            return "error"
        }
    }
    
    // UPDATE "deliveries" SET "destination" = ('newValue') WHERE ("id" = curr_id)
    func updateDelivery(curr_id: Int64, newValue: String){
        let delivery = apiFilter(curr_id)
        do {
            if try db.run(delivery.update(destination <- newValue)) > 0 {
                print("updated this: \(curr_id)")
            } else {
                print("id not found")
            }
        } catch {
            print("update failed: \(error)")
        }
    }
    
    // DELETE FROM "deliveries"
    func deleteAllDeliveries(){
        try! db.run(deliveries.delete())
    }
    
    // DELETE FROM "deliveries" WHERE ("id" = curr_id)
    func deleteOneDelivery(curr_id: Int64){
        let delivery = deliveries.filter(id == curr_id)
        do {
            if try db.run(delivery.delete()) > 0{
                print("deleted this: \(curr_id)")
            } else {
                print("id not found")
            }
        } catch {
            print("delete failed: \(error)")
        }
    }
    
    // ALTER TABLE "deliveries" ADD COLUMN "suffix" TEXT
    func addColumntoDelivery(suffix: Expression<Optional<String>>){
        try! db.run(deliveries.addColumn(suffix))
    }
    
}
