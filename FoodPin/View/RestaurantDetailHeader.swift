//
//  RestaurantDetailHeader.swift
//  FoodPin
//
//  Created by jia on 2019/12/5.
//  Copyright © 2019 jia. All rights reserved.
//

import UIKit

class RestaurantDetailHeader: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var heartImageView: UIImageView!

    var restaurant = Restaurant()
    
}