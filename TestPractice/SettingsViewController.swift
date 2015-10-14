//
//  SettingsViewController.swift
//  TestPractice
//
//  Created by kyz on 15/10/14.
//  Copyright © 2015年 BUAA.Software. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var psdLabel: UILabel!
    
    @IBOutlet weak var batteryLabel: UILabel!
    
    @IBOutlet weak var soundLabel: UILabel!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.getPreference()
    }
    
    func getPreference() {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.nameLabel.text = defaults.stringForKey("name_preference")
        self.psdLabel.text = defaults.stringForKey("password_preference")
        self.batteryLabel.text = String(stringInterpolationSegment: defaults.integerForKey("batteryLimit_preference"))
        if defaults.boolForKey("soundEnable_preference") {
            self.soundLabel.text = "Yes"
        } else {
            self.soundLabel.text = "No"
        }
        
    }
}
