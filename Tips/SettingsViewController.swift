//
//  SettingsViewController.swift
//  Tips
//
//  Created by Stephanie Wei on 2/2/15.
//  Copyright (c) 2015 Stephanie Wei. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip0Field: UITextField!
    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var tip0 = defaults.objectForKey("tip0") as String
        var tip1 = defaults.objectForKey("tip1") as String
        var tip2 = defaults.objectForKey("tip2") as String
        
        tip0Field.text = tip0
        tip1Field.text = tip1
        tip2Field.text = tip2

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editTip(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tip0Field.text, forKey: "tip0")
        defaults.setObject(tip1Field.text, forKey: "tip1")
        defaults.setObject(tip2Field.text, forKey: "tip2")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
