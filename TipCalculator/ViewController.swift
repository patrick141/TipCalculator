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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
     This function allows us to tap anywhere if we
     we want to take the keyboard away in the billField.
    */
    @IBAction func onTap(_ sender: Any) {
        print("hello")
        view.endEditing(true)
        billField.becomeFirstResponder()
    }
    
    /*
     This function calculates our tip and displays it into
     the total label.
     */
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.15,0.18,0.2]
        
        let tip = bill * tipPercentages[tipOutlet.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

