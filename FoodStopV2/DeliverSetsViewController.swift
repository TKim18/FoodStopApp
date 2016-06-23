//
//  DeliverSetsViewController.swift
//  FoodStop
//
//  Created by Sangwon Kim on 1/17/16.
//  Copyright © 2016 Sangwon Kim. All rights reserved.
//

import UIKit

class DeliverSetsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK : PickerView
    @IBOutlet weak var destinationPickerView: UIPickerView!
    var destination = ""
    let destinationPickerData = ["Butterfields","Nicolson","Low Rise","High Rise","Clark Hall","Bennet","Hewitt"]
    
    override func viewDidLoad () {
        super.viewDidLoad()
        destinationPickerView.dataSource = self
        destinationPickerView.delegate = self
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return destinationPickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return destinationPickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        destination = destinationPickerData[row]
    }
}
