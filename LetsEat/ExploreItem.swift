//
//  ExploreItem.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 4/25/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import Foundation

struct ExploreItem {
    var name:String
    var image:String
}

extension ExploreItem{
    init(dict:[String: AnyObject]) {
    
    self.name = dict["name"] as! String
    self.image = dict["image"] as! String
    
    }
}
