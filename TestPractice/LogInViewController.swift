//
//  LogInViewController.swift
//  TestPractice
//
//  Created by kyz on 15/10/12.
//  Copyright © 2015年 BUAA.Software. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func dialTheNumber(sender: AnyObject) {
        // Cannot use in the simulator
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://13204210266")!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "registerCompletion:", name: "RegisterCompletionNotification", object: nil)
    }
    
    func registerCompletion(notification: NSNotification) {
        let data: NSDictionary = notification.userInfo!
        nameTextField.text = data.objectForKey("userName") as? String
        
    }
    
}

