//
//  ViewController.swift
//  FoodStopV2
//
//  Created by Tim Kim on 5/30/16.
//  Copyright © 2016 FoodStop. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var retrieveTextField : UITextField!
    @IBOutlet var currFoodService : UITextField!
    @IBOutlet var currDestination : UITextField!
    @IBOutlet var currFoodChoice : UITextField!
    
    @IBAction func input(sender : AnyObject){
        let sample = Order(foodService : currFoodService.text!, destination: currDestination.text!, foodChoice : currFoodChoice.text!)
        sample!.insertOrder()
    }
    
    @IBAction func retrieve(sender : AnyObject){
        let conn = Order(foodService : "", destination : "", foodChoice : "")
        let sample : PFObject? = conn!.getOrder(currFoodService.text!, dest: currDestination.text!, fC: currFoodChoice.text!)
        retrieveTextField.text = (sample?["destination"] as! String)
    }


}

