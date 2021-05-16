//
//  LocationViewController.swift
//  LetsEat
//
//  Created by Peiyu Joyce Lin Williamson on 5/9/21.
//  Copyright © 2021 Williamson. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    /*let locations = ["Aspen", "Boston", "Charleton", "Chicago", "Houston", "Las Vegas", "Los Angeles", "Miami", "New Orleans", "New York", "Philadelphia", "Portland", "San Antonio", "San Francisco", "Washington District of Columbia"]*/
    
    let manager = LocationDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    
    
}


//MARK: Private Extension
private extension LocationViewController {
    
    func initialize() {
        manager.fetch()
    }
}

//MARK: UITableViewDataSource
extension LocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.numbeOfItems()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as UITableViewCell
        //cell.textLabel?.text = locations[indexPath.item]
        cell.textLabel?.text = manager.locationItem(at: indexPath)
        return cell
        
    }

    
}

