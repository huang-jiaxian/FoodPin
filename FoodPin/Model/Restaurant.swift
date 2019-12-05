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
    var image: String
    var phone: String
    var description: String
    var isVisited: Bool
    
    init(name: String, type: String, location: String, phone: String, description: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.phone = phone
        self.description = description
        self.isVisited = isVisited
    }
    
    convenience init() {
        self.init(name: "", type: "", location: "", phone: "", description:"", image: "", isVisited: false)
    }
}
