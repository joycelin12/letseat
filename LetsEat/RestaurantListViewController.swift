//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/5/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {
    
    var manager = RestaurantDataManager()
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
        guard let location = selectedCity?.city, let type = selectedType else {
            return
        }
        print("type \(type)")
        print(RestaurantAPIManager.loadJSON(file: location))
        createData()
        setupTitle()
    }
    
   
}

//MARK: Private Extension
private extension RestaurantViewController {
    
    func createData() {
    
        guard let location = selectedCity?.city, let filter = selectedType
        else { return }
        manager.fetch(by:location, with: filter) {
            _ in if manager.numberOfItems() >  0 {
                collectionView.backgroundView = nil
            }
            
            else {
                let view = NoDataView(frame: CGRect (x:0 , y:0 , width:CollectionView.frame.width, height: collectionView.frame.height))
                view.set(title: "Restaurants")
                view.set(desc: "No restaurants found.")
                collectionView.backgroundView = view
            }
            collectionView.reloadData()
        
        }
    }
    
    func setupTitle() {
    
        navigationController?.setNavigationBarHidden(false, animated: false)
        if let city = selectedCity?.city, let state = selectedCity?.state {
            title = "\(city.uppercased()), \(state.uppercased())"
            
        }
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK UICollectionViewDataSource
extension RestaurantListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath) as! RestaurantCell
        let item = manager.restaurantItem(at: indexPath)
        if let name = item.name  {cell.lblTitle.text = name}
        if let cuisine = item.subtitle {
            cell.lblCuisine.text = cuisine
        }
        
        if let image = item.imageURL {
            if let url  = URL(string: image) {
                let data  = try? Data (contentsOf: url)
                    if let imageData = data {
                        DispatchQueue.main.async {
                            cell.imgRestaurant.image = UIImage(data: imageData)
                        }
            }
            }
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.numberOfItems()
    }


}
