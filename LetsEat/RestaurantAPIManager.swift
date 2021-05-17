//
//  RestaurantAPIManager.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/16/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import Foundation

struct RestaurantAPIManager {
    
    static func loadJSON(file name:String) -> [[String:AnyObject]]
    {
        var items = [[String:AnyObject]]()
        
        guard let path = Bundle.main.path(forResource: name, ofType: "json"),
            let data = NSData(contentsOfFile: path) else {
                return [[:]]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as AnyObject
            if let restaurants = json as?  [[String: AnyObject]] {
                items = restaurants as [[String: AnyObject]]
            }
        }
        
        catch {
            
            print("error serializing JSON: (error)")
            items = [[:]]
            
        }
        return items 
    }
}
