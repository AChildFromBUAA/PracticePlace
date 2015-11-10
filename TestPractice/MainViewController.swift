//
//  MainViewController.swift
//  TestPractice
//
//  Created by kyz on 15/11/5.
//  Copyright © 2015年 BUAA.Software. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    

    @IBAction func alert(sender: UIBarButtonItem) {
        var alert = UIAlertController(title: "Action Sheet", message: "test for action sheet", preferredStyle: .ActionSheet)
    }
}
