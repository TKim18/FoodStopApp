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
    @IBOutlet var updateTextField : UITextField!
    @IBOutlet var idTextField : UITextField!
    
    @IBAction func askForValue(sender : AnyObject){
        db.insertOrder("WesWings", dest: "Butterfields C", fC: "Breakfast Pail")
        db.insertOrder("Usdan", dest: "Olin", fC: "Buffet")
        db.insertOrder("Summerfields", dest: "Usdan", fC: "Burger 1")
        let temp:String = db.selectAllOrders()
        resultsTextView.text = temp
    }
    
    @IBAction func clearOrders(sender : AnyObject){
        db.deleteAllOrders()
        resultsTextView.text = db.selectAllOrders()
    }
    
    @IBAction func changeOrder(sender : AnyObject){
        db.updateOrder(arbId, newValue: "Home!")
        resultsTextView.text = db.selectAllOrders()
        updateTextField.text = db.selectDestinationFromOneOrder(arbId)
    }
    
    @IBAction func changeId(sender : AnyObject){
        arbId = Int64((idTextField.text! as NSString).doubleValue)
    }
    
 /*
    @IBAction func updateOrder(sender : AnyObject){
        let order = db.apiFilter(2)
        do {
            if try db.run(order.update(destination <- "Home!")) > 0 {
                print("updated this")
            } else {
                print("id not found")
            }
        } catch {
            print("update failed: \(error)")
        }

    }
*/
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

