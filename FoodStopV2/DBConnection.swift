//
//  Database Implementation.swift
//  FoodStopV2
//
//  Created by Tim Kim on 6/1/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import SQLite

let path = NSSearchPathForDirectoriesInDomains(
    .DocumentDirectory, .UserDomainMask, true
    ).first!

let db = try! Connection("\(path)/db.sqlite3")
//let db = try! Connection("orderlist.db.sqlite3")

var arbId:Int64 = 0