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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello Explore View Controller")

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
        return collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath)
    }
   
    // tells collection view how many different sections we want to display
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //only one section
        return 1
    }
    
    //tell collection view how many different items inside the section we set up
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //display 20 items
        return 20
    }
    
    //to dismiss location modal when you hit cancel button
    @IBAction func unwindLocationCancel(segue:UIStoryboardSegue)
    {}
}
