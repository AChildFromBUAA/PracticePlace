//
//  RegisterViewController.swift
//  TestPractice
//
//  Created by kyz on 15/10/12.
//  Copyright © 2015年 BUAA.Software. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    
    @IBAction func add(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        let nameDic = NSDictionary(object: self.textFieldName.text!, forKey: "userName")
        NSNotificationCenter.defaultCenter().postNotificationName("RegisterCompletionNotification", object: nil, userInfo: nameDic as [NSObject : AnyObject])
    }
}
