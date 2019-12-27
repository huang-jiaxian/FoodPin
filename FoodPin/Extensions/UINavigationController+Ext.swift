//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by jia on 2019/12/29.
//  Copyright © 2019 jia. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
