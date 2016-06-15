//
//  ViewController.swift
//  Tipsy
//
//  Created by Rohan Y. Shah on 6/14/16.
//  Copyright © 2016 Rohan Y. Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splittersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //splittersIncrementer.stepValue = 2
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
    @IBOutlet weak var splittersIncrementer: UIStepper!
    

    @IBAction func didTapStepper(sender: UIStepper) {
        //print("tapped stepper")
        //print(splittersIncrementer.value)
        let splitDouble = splittersIncrementer.value
        let splitInt = Int(splitDouble)
        let splitString = String(splitInt)
        splittersLabel.text = splitString
    }
    
    @IBAction func Clear(sender: AnyObject) {
        billField.text = String(0.0)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipTiers = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipTiers[tipControl.selectedSegmentIndex]
        var splitters = Double(splittersLabel.text!)
        if splitters == 0 {
            splitters = 1
        }
        let total = (bill + tip)/splitters!
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
}

