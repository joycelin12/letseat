//
//  ExploreViewController.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 4/25/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController,
UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView:UICollectionView!
    let manager = ExploreDataManager()


    override func viewDidLoad() {
        super.viewDidLoad()
                manager.fetch()

        // Do any additional setup after loading the view.
    }
    
    //to add a header to collectionview
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //identifier helps xcode know what view we referring to
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
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
    
    //to dismiss location modal when you hit cancel button
    @IBAction func unwindLocationCancel(segue:UIStoryboardSegue)
    {}
}
