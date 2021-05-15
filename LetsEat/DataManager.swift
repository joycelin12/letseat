//
//  DataManager.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/13/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import Foundation

protocol DataManager {

    func load(file name:String)  -> [[String:AnyObject]]
}

extension DataManager {
    
        func load(file name:String) -> [[String:AnyObject]]
        {
            guard let path = Bundle.main.path(forResource: name, ofType: "plist"), let items = NSArray(contentsOfFile: path) else { return [[:]] }
            return items as! [[String:AnyObject]]
        }
}
    
    



