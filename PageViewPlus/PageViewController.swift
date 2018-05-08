//
//  PageViewController.swift
//  PageViewPlus
//
//  Created by macbook on 4/24/18.
//  Copyright © 2018 Jaminya. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    //var viewController = WxViewController()

   /* fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "wxViewController") //,
          // self.getViewController(withIdentifier: "Page2")
        ]
    }()*/
    
    // empty array of views
    var pages: [UIViewController] = []
    var wxData: Forecast?
    
   /* fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }*/
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self
        //self.delegate   = self
        
        if let firstVC = pages.first
       {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
       }
    }

}


extension PageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
    
        if previousIndex < 0 {
            return nil
        } else {
            return pages[previousIndex]
        }
/*
     guard previousIndex >= 0  else { return pages.last }
        
        guard pages.count > previousIndex else { return nil        }
 */
        
       // return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        
        if nextIndex < pages.count {
            return pages[nextIndex]
        } else {
            return nil
        }
        
    /*    guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil         }
        
        return pages[nextIndex] */
    } 
}
