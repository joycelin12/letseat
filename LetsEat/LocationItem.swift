//
//  LocationItem.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/16/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import Foundation

struct LocationItem {
    var state: String?
    var city: String?
}

extension LocationItem {
    init(dict: [String: AnyObject]) {
        self.state = dict["state"] as? String
        self.city = dict["city"] as? String
    }
    
    var full: String {
    
        guard let city = self.city, let state = self.state else {
            return ""
        }
        return "\(city), \(state)"
    }
}
