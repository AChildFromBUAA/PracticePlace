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
    
    @IBOutlet weak var shakeLabel: UILabel!
    
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
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        motionManger.stopAccelerometerUpdates()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        motionManger.stopAccelerometerUpdates()
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            self.shakeLabel.text = "Shaking"
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            self.shakeLabel.text = "End Shake"
        }
    }
    
    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            self.shakeLabel.text = "Shake Cancelled"
        }
    }
    
}
