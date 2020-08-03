//
//  ViewController.swift
//  TipCalculator
//
//  Created by Patrick Amaro Rivera on 8/2/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipOutlet: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.41, green: 0.79, blue: 0.78, alpha: 1.00)
    }
    
    /*
     This function allows us to tap anywhere if we
     we want to take the keyboard away in the billField.
    */
    @IBAction func onTap(_ sender: Any) {
        billField.becomeFirstResponder()
        view.endEditing(true)
    }
    
    /*
     This function calculates our tip and displays it into
     the total label.
     */
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.15,0.18,0.2]
        let percent = tipPercentages[tipOutlet.selectedSegmentIndex]
        let tip = bill * percent
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f", total)
        tipSlider.value = Float(percent)
        
        tipPercentLabel.text = "%" + String(format: "%.2f", percent * 100)
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let percent = Double(tipSlider.value)
        let total = (1 + percent) * bill
        
        tipLabel.text = String(format: "$%.2f", percent * bill)
        totalLabel.text = String(format: "$%.2f", total)
        tipPercentLabel.text = "%" + String(format: "%.2f", percent * 100)
    }
}

