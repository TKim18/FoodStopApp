//
//  OrderConfirmationViewController.swift
//  FoodStop
//
//  Created by Tim Kim on 1/19/16.
//  Copyright © 2016 Sangwon Kim. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //displayService.text = order!.getFoodService()
        //displayDestination.text = order!.getDestination()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var displayService : UITextView!
    @IBOutlet var displayDestination : UITextView!
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
