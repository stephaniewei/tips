//
//  ViewController.swift
//  Tips
//
//  Created by Stephanie Wei on 2/2/15.
//  Copyright (c) 2015 Stephanie Wei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    internal var tip0 : String = ""
    internal var tip1 : String = ""
    internal var tip2 : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("15", forKey: "tip0")
        defaults.setObject("18", forKey: "tip1")
        defaults.setObject("20", forKey: "tip2")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        tip0 = defaults.objectForKey("tip0") as String
        tip1 = defaults.objectForKey("tip1") as String
        tip2 = defaults.objectForKey("tip2") as String
        
        tipControl.setTitle(tip0 + "%", forSegmentAtIndex: 0)
        tipControl.setTitle(tip1 + "%", forSegmentAtIndex: 1)
        tipControl.setTitle(tip2 + "%", forSegmentAtIndex: 2)
        onEditingChanged(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [tip0, tip1, tip2]
        var tipPercentage = (tipPercentages[tipControl.selectedSegmentIndex] as NSString).doubleValue / 100
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

