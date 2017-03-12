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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.1, 0.15, 0.2]
        
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipPercentageControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        oneFriendLabel.text = String(format: "$%.2f", total);
        twoFriendLabel.text = String(format: "$%.2f", total / 2);
        threeFriendLabel.text = String(format: "$%.2f", total / 3);
        fourFriendLabel.text = String(format: "$%.2f", total / 4);
        
    }
    
}

