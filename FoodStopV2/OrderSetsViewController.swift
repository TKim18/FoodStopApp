//
//  OrderSetsViewController.swift
//  FoodStop
//
//  Created by Sangwon Kim on 1/7/16.
//  Copyright © 2016 Sangwon Kim. All rights reserved.
//

import UIKit

class OrderSetsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBOutlet weak var destinationPicker: UIPickerView!
    var destination = "Butterfields"
    //Default: Butterfields
    var foodService = ""
    let destinationData = ["Butterfields","Nicolson","Low Rise","High Rise","Clark Hall","Bennet","Hewitt"]
    
    override func viewDidLoad () {
        super.viewDidLoad()
        destinationPicker.dataSource = self
        destinationPicker.delegate = self
        //displayOrderNumber.text = String(getCurOrderID())
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return destinationData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return destinationData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        destination = destinationData[row]
    }
    
    @IBOutlet var displayOrderNumber: UITextView!
    @IBOutlet var displayInfo : UITextView!
    @IBOutlet var isSummies : UIButton!
    @IBOutlet var isWesWings : UIButton!
    @IBOutlet var isUsdan : UIButton!
    
    @IBAction func chooseServiceSummies(sender : UIButton){
        foodService = "Summerfields"
    }
    
    @IBAction func chooseServiceWeswings(sender : UIButton){
        foodService = "WesWings"
    }
    
    @IBAction func chooseServiceUsdan(sender : UIButton){
        foodService = "Usdan"
    }
/*
    @IBAction func getResults(sender : AnyObject){
        Orders[curOrderID] = Order(foodService : foodService, destination : destination)
        increment()
    }
    
    @IBAction func getConfirmation(sender : UIButton){
        let order = Orders[curOrderID]
        if (order!.getFoodService() != "" && order!.getDestination() != "") {
            displayInfo.text = "Your food from \(order!.getFoodService()) is going to \(order!.getDestination())"
        }
        else {
            displayInfo.text = "Please choose a dining service and destination."
        }
    }
*/
}
