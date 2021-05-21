//
//  ExploreViewController.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 4/25/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    let manager = ExploreDataManager()
    var selectedCity:LocationItem?
    var headerView: ExploreHeaderView!


    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Segue.locationList.rawValue:
            showLocationList(segue: segue)
        case Segue.restaruantList.rawValue:
            showRestaurantListing(segue: segue)
        default:
            print("Segue not added")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segue.restaruantList.rawValue {
        
            guard selectedCity != nil else {
                showAlert()
                return false
            }
            return true
        }
        return true
    }
    
    
    
}

//MARK: Private Extension
private extension ExploreViewController {
    
    func initialize() {
        manager.fetch()
    }
    
    func showLocationList(segue:UIStoryboardSegue)
    {
        guard let navController = segue.destination as? UINavigationController,
            let viewController = navController.topViewController as? LocationViewController
        else {
            return
        }
        guard let city = selectedCity else {
            return
        }
        viewController.selectedCity = city
    }
    
    func showRestaurantListing(segue:UIStoryboardSegue) {
        if let viewController = segue.destination as?
        RestaurantListViewController, let city = selectedCity,
            let index = collectionView.indexPathsForSelectedItems?.first
        {
            viewController.selectedType = manager.explore(at: index).name
            viewController.selectedCity = city
        }
    }
    
    func showAlert() {
        
        let alertController = UIAlertController(title: "Location Needed",
            message:" Please select a location.", preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    //to dismiss location modal when you hit cancel button
    @IBAction func unwindLocationCancel(segue:UIStoryboardSegue)
    {}
    
    @IBAction func unwindLocationDone(segue:UIStoryboardSegue)
    {
        print("inside")
        if let viewController = segue.source as?
            LocationViewController {
            print("hello")
            selectedCity = viewController.selectedCity
            if let location = selectedCity {
                print("haHaha")
                headerView.lblLocation.text = location.full
            }
            print("heee")
        }
    }



}

//MARK: UICollectionViewDataSource 
extension ExploreViewController: UICollectionViewDataSource
{
    
    //to add a header to collectionview
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //identifier helps xcode know what view we referring to
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            headerView = header as? ExploreHeaderView
        return headerView
    }
    
    // gets called for every item needed
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        let item = manager.explore(at: indexPath)
        cell.lblName.text =  item.name
        cell.imgExplore.image = UIImage(named: item.image)
        return cell
        
    }
    
    // tells collection view how many different sections we want to display
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //only one section
        return 1
    }
    
    //tell collection view how many different items inside the section we set up
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //display 20 items
        return manager.numberOfItems()
    }
    

}


