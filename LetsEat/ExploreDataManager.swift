//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 4/25/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import Foundation

class ExploreDataManager {
    
    fileprivate var items:[ExploreItem] = []
    
    
    func fetch() {
        for data in loadData()
        {
            items.append(ExploreItem(dict:data))
        }
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func explore(at index:IndexPath) -> ExploreItem {
        return items[index.item]
    }
    
    //fileprivate to give access level
    fileprivate func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "ExploreData", ofType: "plist"),
            let items = NSArray(contentsOfFile: path) else {
                return [[:]]
        }
        return items as! [[String : AnyObject]]
    }
}
