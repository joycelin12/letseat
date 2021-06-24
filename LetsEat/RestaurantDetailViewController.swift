//
//  RestaurantDetailViewController.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/15/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    //Nav Bar
    @IBOutlet weak var btnHeart:UIBarButtonItem!
    
    //Cell One
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblCuisine:UILabel!
    @IBOutlet weak var lblHeaderAddress:UILabel!
    
    
    //Cell Two
    @IBOutlet weak var lblTableDetails:UILabel!
    //Cell Three
    @IBOutlet weak var lblOverallRating:UILabel!
    
    //Cell Eight
    @IBOutlet weak var lblAddress:UILabel!
    @IBOutlet weak var imgMap:UIImageView!
    
    var selectedRestaurant:RestaurantItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        dump(selectedRestaurant as Any)
        
    }

   
}
