//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/5/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {
    
    var selectedRestaurant:RestaurantItem?
    var selectedCity:LocationItem?
    var selectedType:String?
    
    
    
    @IBOutlet var collectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("selected city \(selectedCity as Any)")
        print("selected type \(selectedType as Any)")
    
    }
    
   
}

//MARK: Private Extension
private extension RestaurantViewController {
    
}

//MARK UICollectionViewDataSource
extension RestaurantListViewController: UICollectionViewDataSource {
    
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
