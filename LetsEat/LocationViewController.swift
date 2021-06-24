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
    var selectedCity:LocationItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    
    func set(selected cell: UITableViewCell, at indexPath: IndexPath) {
    
        
        if let city = selectedCity?.city {
            let data = manager.findLocation(by: city)
            
            if data.isFound {
                
                if indexPath.row == data.position {
                    cell.accessoryType = .checkmark
                    
                }
                else { cell.accessoryType = .none }
            }
            
        }
        else {
           
            cell.accessoryType = .none

        }
    
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
        return manager.numberOfItems()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as UITableViewCell
        //cell.textLabel?.text = locations[indexPath.item]
        cell.textLabel?.text = manager.locationItem(at:indexPath).full
        set(selected: cell, at: indexPath)
        return cell
        
    }
    
    
}

//MARK UITableViewDelegate
extension LocationViewController: UITableViewDelegate {
    
    
    func tableView(_tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let cell = tableView.cellForRow(at:indexPath) {
            cell.accessoryType = .checkmark
            selectedCity = manager.locationItem(at:indexPath)
            tableView.reloadData()
        }
    }
}

