//
//  Helper.swift
//  UIPageViewControllerBurgersMenu
//
//  Created by Артем on 3/21/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

struct Burgers {
    static var arrNamesImage = ["1", "2", "3", "4", "5"]
    let image = UIImage()
    let price = String()
}

struct Add {
   static func burgers() -> UIImageView {
        let iv = UIImageView()
        
        for i in Burgers.arrNamesImage {
            iv.image = UIImage(named: i)
        }
        
        return iv
        
    }
}
