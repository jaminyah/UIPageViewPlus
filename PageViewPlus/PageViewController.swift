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
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self
        //self.delegate   = self
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "wxViewController") as? WxViewController

        // Listen for new viewController
       // NotificationCenter.default.addObserver(self, selector: #selector(getNewViewController(_ :)), name: .wxViewNotification, object: viewController)
        
        guard let city = wxData?.city, city != ""  else {
            print("city error")
            return
        }
        viewController?.city = city
        
        guard let temp = wxData?.temperature, temp != -99  else {
            print("temperature error")
            return
        }
        viewController?.temperature = String(describing: temp)
        
        pages.append(viewController!)
        

        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
  /*  func getNewViewController(_ notification: Notification) {
        print("In getViewController")
        viewController = notification.object as! WxViewController
        
            pages.append(viewController)
        
        let cityRegion = viewController.cityRegion.text
            print(cityRegion!)
    }*/
}


extension PageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
 {
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0          else { return pages.last }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil         }
        
        return pages[nextIndex]
    }
}
