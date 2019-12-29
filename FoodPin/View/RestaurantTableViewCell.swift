//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by jia on 2019/11/13.
//  Copyright © 2019 jia. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    // declare the variables,outlet : 输出
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel! {
        didSet {
            locationLabel.numberOfLines = 0
        
        }
    }
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView : UIImageView!
    @IBOutlet var heartImageView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
