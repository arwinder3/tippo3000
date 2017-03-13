//
//  SettingsViewController.swift
//  tippo3000
//
//  Created by Gill, Arvy on 3/12/17.
//  Copyright © 2017 Gill, Arvy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var lowPercentageField: UITextField!
    @IBOutlet weak var mediumPercentageField: UITextField!
    @IBOutlet weak var highPercentageField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        let defaultLowTipPercentage = defaults.integer(forKey: "lowTipPercentage")
        let defaultMediumTipPercentage = defaults.integer(forKey: "mediumTipPercentage")
        let defaultHighTipPercentage = defaults.integer(forKey: "highTipPercentage")

        if (defaultLowTipPercentage > 0) {
            lowPercentageField.text = "\(defaultLowTipPercentage)"
        } else {
            lowPercentageField.text = "10"
        }
        
        if (defaultMediumTipPercentage > 0) {
            mediumPercentageField.text = "\(defaultMediumTipPercentage)"
        } else {
            mediumPercentageField.text = "15"
        }
        
        if (defaultHighTipPercentage > 0) {
            highPercentageField.text = "\(defaultHighTipPercentage)"
        } else {
            highPercentageField.text = "20"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lowPercentageChanged(_ sender: Any) {
        if (lowPercentageField.text != "") {
            defaults.set(Int(lowPercentageField.text!)!, forKey: "lowTipPercentage")
        } else {
            defaults.set(10, forKey: "lowTipPercentage")
        }
        defaults.synchronize()
    }

    @IBAction func mediumPercentageChanged(_ sender: Any) {
        if (mediumPercentageField.text != "") {
            defaults.set(Int(mediumPercentageField.text!)!, forKey: "mediumTipPercentage")
        } else {
            defaults.set(15, forKey: "mediumTipPercentage")
        }
        defaults.synchronize()
    }

    @IBAction func highPercentageChanged(_ sender: Any) {
        if (highPercentageField.text != "") {
            defaults.set(Int(highPercentageField.text!)!, forKey: "highTipPercentage")
        } else {
            defaults.set(20, forKey: "highTipPercentage")
        }
        defaults.synchronize()
    }
}
