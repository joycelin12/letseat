//
//  RestaurantDetailViewController.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/15/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    var selectedRestaurant:RestaurantItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        dump(selectedRestaurant as Any)
        
    }

   
}
