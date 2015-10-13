//
//  PageViewController.swift
//  TestPractice
//
//  Created by kyz on 15/10/13.
//  Copyright © 2015年 BUAA.Software. All rights reserved.
//

import UIKit

enum DirectionForward : Int {
    case Before = 1
    case After = 2
}

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pageIndex = 0
    var directionForward = DirectionForward.After
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self
        
        let mainStoryBoard = self.storyboard!
        let pageViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("page1") as UIViewController
        let viewControllers: NSArray = [pageViewController]
        self.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        self.view.addSubview(pageViewController.view)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        pageIndex--
        
        if pageIndex < 0 {
            pageIndex = 0
            return nil
        }
        
        directionForward = DirectionForward.Before
        let mainStoryBoard = self.storyboard!
        let pageId = NSString(format: "page%i", pageIndex + 1)
        let pvController = mainStoryBoard.instantiateViewControllerWithIdentifier(pageId as String) as UIViewController
        
        return pvController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        pageIndex++
        
        if pageIndex > 2 {
            pageIndex = 2
            return nil
        }
        
        directionForward = DirectionForward.After
        let mainStoryBoard = self.storyboard!
        let pageId = NSString(format: "page%i", pageIndex + 1)
        let pvController = mainStoryBoard.instantiateViewControllerWithIdentifier(pageId as String) as UIViewController
        
        return pvController

    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed == false {
            if directionForward == DirectionForward.After {
                pageIndex--
            }
            if directionForward == DirectionForward.Before {
                pageIndex++
            }
        }
    }
}