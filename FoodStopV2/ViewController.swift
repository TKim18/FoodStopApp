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
    
    @IBOutlet var resultsTextView : UITextView!
    @IBOutlet var someTextField : UITextField!
    @IBOutlet var updateTextField : UITextField!
    @IBOutlet var idTextField : UITextField!

    override func viewDidLoad() {
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

