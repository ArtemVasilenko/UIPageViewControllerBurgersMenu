//
//  MainPageViewController.swift
//  UIPageViewControllerBurgersMenu
//
//  Created by Артем on 3/21/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    private lazy var arrBurgers: [ViewController] = []
    let pageControl = UIPageControl.appearance()
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.4269909263, green: 0.9705738425, blue: 0.9563221335, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        
        for i in Burgers.arrNamesImage {
            createVC(i)
            //someVC.myImageView.image = UIImage(named: i
        }
        
        if let first = arrBurgers.first{
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }

        self.dataSource = self
        
    }
    
    func createVC(_ image: String) {
        let someVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "someVC")
        
        let myImageView = UIImageView()
        let label = UILabel()
        
        myImageView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        myImageView.center = someVC.view.center
        myImageView.image = UIImage(named: image)
        
        label.frame = CGRect(x: 120, y: 500, width: 100, height: 50)
        
        someVC.view.addSubview(myImageView)
        someVC.view.addSubview(label)
        
        arrBurgers.append(someVC as! ViewController)
        
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
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrBurgers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let firstVC = arrBurgers.first,
        let vcIndex = self.arrBurgers.firstIndex(of: firstVC)
            else { return 0 }
        
        return vcIndex
    }
    

}
