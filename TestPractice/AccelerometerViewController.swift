//
//  AccelerometerViewController.swift
//  TestPractice
//
//  Created by kyz on 15/11/10.
//  Copyright © 2015年 BUAA.Software. All rights reserved.
//

import UIKit

class AccelerometerViewController: UIViewController {

    @IBOutlet weak var xLabel: NSLayoutConstraint!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    @IBOutlet weak var xProgress: UIProgressView!
    @IBOutlet weak var yProgress: UIProgressView!
    @IBOutlet weak var zProgress: UIProgressView!
    
    let motionManger = AppDelegate.Motion.Manger
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {

        motionManger.accelerometerUpdateInterval = 0.1
        if motionManger.accelerometerAvailable {
            motionManger.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) -> Void in
                if error != nil {
                    self.motionManger.stopAccelerometerUpdates()
                } else  {
                    
                    self.xProgress.progress = abs(Float((data?.acceleration.x)!))
                    self.yProgress.progress = abs(Float((data?.acceleration.y)!))
                    self.zProgress.progress = abs(Float((data?.acceleration.z)!))
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
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
