//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/12/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import Foundation

class LocationDataManager {

    private var locations:[String] = []
    
    init() {
        fetch()
        
    }
    
    func fetch() {
        for location in loadData() {
            if let city = location["city"] as? String,
                let state = location["state"] as? String {
                locations.append("\(city), \(state)")
            }
        }
    }
    
    func numbeOfItems() -> Int {
        return locations.count
    }
    
    func locationItem(at index:IndexPath) -> String {
        return locations[index.item]
        
    }
    
    private func loadData()  -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource:
            "Locations", ofType: "plist"), let items =
            NSArray(contentsOfFile: path) else {
                return [[:]]
            }
        return items as! [[String :AnyObject]]
    
    
    }
    

}

