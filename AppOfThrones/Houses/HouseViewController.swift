//
//  HouseViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 13/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var houses: [House] = []
    
    var house: [House] = [House.init(imageName: "Targaryen", name: "Targaryen", words: "Fire and Blood", seat: "Red Keep, King's Landing"), House.init(imageName: "Stark", name: "Stark", words: "Winter Is Coming", seat: "Winterfell")]
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        let nib = UINib.init(nibName: "HouseTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HouseTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupUI() {
        self.title = "Houses"
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house_selected = houses[indexPath.row]
        
        if let splitViewController = self.splitViewController,
            splitViewController.viewControllers.count > 1 {
            if let navigationController = splitViewController.viewControllers[1] as? UINavigationController,
                let detailViewController = navigationController.visibleViewController as? HouseDetailViewController {
                detailViewController.house = house_selected
            }
        } else {
            let houseDetailVC = HouseDetailViewController.init(house: house_selected)
            self.navigationController?.pushViewController(houseDetailVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return house.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseTableViewCell", for: indexPath) as? HouseTableViewCell {
            cell.setHouse(house[indexPath.row])
            return cell
        }
        fatalError("Could not create Account cells")
    }


}
