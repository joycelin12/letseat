//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/5/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var collectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

   
}
