//
//  ViewController.swift
//  FoodStopV2
//
//  Created by Tim Kim on 5/30/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let db = OrderDatabaseImplementation()
    
    @IBOutlet var resultsTextView : UITextView!
    @IBOutlet var someTextField : UITextField!
    
    @IBAction func askForValue(sender : AnyObject){
        db.insertOrder("WesWings", dest: "Butterfields C", fC: "Breakfast Pail")
        db.insertOrder("Usdan", dest: "Olin", fC: "Buffet")
        db.insertOrder("Summerfields", dest: "Usdan", fC: "Burger 1")
        let temp:String = db.selectAllOrders()
        resultsTextView.text = temp
        someTextField.text = db.selectOneOrder()
    }
    
    @IBAction func clearOrders(sender : AnyObject){
        db.deleteAllOrders()
        resultsTextView.text = db.selectAllOrders()
        if (someTextField.text == nil){
            someTextField.text = "There is nothing in the database!"
        }
        else{
            someTextField.text = db.selectOneOrder()
        }
    }
    
    override func viewDidLoad() {
        db.createOrdersTable()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

