//
//  Restaurant.swift
//  FoodPin
//
//  Created by jia on 2019/11/29.
//  Copyright © 2019 jia. All rights reserved.
//

import Foundation
// define a class
class Restaurant {
    var name: String
    var type: String
    var location: String
    var isVisited: Bool
    
    init(name: String,type: String,location: String,isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.isVisited = isVisited
    }
    
    convenience init() {
        self.init(name:"",type:"",location:"",isVisited:false)
    }
}
