//
//  MainPageViewController.swift
//  UIPageViewControllerBurgersMenu
//
//  Created by Артем on 3/21/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    var someVC = ViewController()
    
    private lazy var arrBurgers: [ViewController] = {
        
        var arr = [ViewController]()
        
        for i in Burgers.arrNamesImage {
            arr.append(someVC)
            //someVC.myImageView.image = UIImage(named: i)
        }
        
        
        
        return arr
        
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let first = arrBurgers.first{
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }

        self.dataSource = self
        
    }
    
}


extension MainPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
        guard let vcIndex = arrBurgers.firstIndex(of: viewController as! ViewController) else { return nil }
        let previusIndex = vcIndex - 1
        
        guard previusIndex >= 0 else { return nil }
        guard arrBurgers.count > previusIndex else { return nil }
        
        return arrBurgers[previusIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = arrBurgers.firstIndex(of: viewController as! ViewController) else { return nil }
        let nextIndex = vcIndex + 1
        
        guard nextIndex >= 0 else { return nil }
        guard arrBurgers.count > nextIndex else { return nil }
        
        
        return arrBurgers[nextIndex]
    }
    
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        <#code#>
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        <#code#>
//    }
    
    
}
