//
//  ViewController.swift
//  FoodStopV2
//
//  Created by Tim Kim on 5/30/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultsTextView : UITextView!
    @IBOutlet var someTextField : UITextField!
    
    @IBAction func getRowNumber(sender : AnyObject){
        someTextField.text = "heyhey"
    }
    
    @IBAction func askForValue(sender : AnyObject){
        let db = OrderDatabaseImplementation()
        //db.createOrdersTable()
        db.insertOrder("WesWings", dest: "Butterfields C", fC: "Quesadilla")
        let temp:String = db.selectAllOrders()
        resultsTextView.text = temp
        someTextField.text = db.selectOneOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

