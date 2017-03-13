//
//  ViewController.swift
//  tippo3000
//
//  Created by Gill, Arvy on 3/12/17.
//  Copyright © 2017 Gill, Arvy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageControl: UISegmentedControl!
    
    @IBOutlet weak var oneFriendLabel: UILabel!
    @IBOutlet weak var twoFriendLabel: UILabel!
    @IBOutlet weak var threeFriendLabel: UILabel!
    @IBOutlet weak var fourFriendLabel: UILabel!
    
    @IBOutlet weak var amountPerFriendView: UIView!
    
    var tipPercentages: [Int] = [10, 15, 20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

        // Check if we have any defaults for low, medium, high tip percentages
        /*
        let defaults = UserDefaults.init()
        let defaultLowTipPercentage = defaults.double(forKey: "lowTipPercentage")
        let defaultMediumTipPercentage = defaults.double(forKey: "mediumTipPercentage")
        let defaultHighTipPercentage = defaults.double(forKey: "maxTipPercentage")
        defaults.synchronize()
        
        if (defaultLowTipPercentage > 0) {
            tipPercentages[0] = defaultLowTipPercentage
        }
        if (defaultMediumTipPercentage > 0) {
            tipPercentages[1] = defaultMediumTipPercentage
        }
        if (defaultHighTipPercentage > 0) {
            tipPercentages[2] = defaultHighTipPercentage
        }*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let defaultLowTipPercentage = defaults.integer(forKey: "lowTipPercentage")
        let defaultMediumTipPercentage = defaults.integer(forKey: "mediumTipPercentage")
        let defaultHighTipPercentage = defaults.integer(forKey: "highTipPercentage")
        
        if (defaultLowTipPercentage > 0) {
            tipPercentages[0] = defaultLowTipPercentage
        }
        if (defaultMediumTipPercentage > 0) {
            tipPercentages[1] = defaultMediumTipPercentage
        }
        if (defaultHighTipPercentage > 0) {
            tipPercentages[2] = defaultHighTipPercentage
        }
        
        tipPercentageControl.setTitle("\(tipPercentages[0])%", forSegmentAt: 0)
        tipPercentageControl.setTitle("\(tipPercentages[1])%", forSegmentAt: 1)
        tipPercentageControl.setTitle("\(tipPercentages[2])%", forSegmentAt: 2)
        
        // TODO: Calculate the tip again, in case the default percentages have changed.
        // They could change due to a change in settings. This would cause the UI to show the tip
        // at the old tip value, if changed.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * Double(Double(tipPercentages[tipPercentageControl.selectedSegmentIndex]) / Double(100))
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if (bill > 0) {
            oneFriendLabel.text = String(format: "$%.2f", total)
            twoFriendLabel.text = String(format: "$%.2f", total / 2)
            threeFriendLabel.text = String(format: "$%.2f", total / 3)
            fourFriendLabel.text = String(format: "$%.2f", total / 4)
            amountPerFriendView.isHidden = false
        } else {
            amountPerFriendView.isHidden = true
        }
    }
}

