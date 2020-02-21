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

    
    
// MARK: - Life Cycle
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupData()
        
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
    
    // MARK : -Setup Functions
    
    
    func setupUI() {
        self.title = "Houses"
        
        let nib = UINib.init(nibName: "HouseTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HouseTableViewCell")
    }
    
    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "houses", withExtension: "json") {
        do {
        let data = try Data.init(contentsOf: pathURL)
        let decoder = JSONDecoder()
        houses = try decoder.decode([House].self, from: data)
            self.tableView.reloadData()
        } catch {
            fatalError(error.localizedDescription)
        }
        } else {
            fatalError("Could not build the parh url")
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = houses[indexPath.row]
        
        if let splitViewController = self.splitViewController,
            splitViewController.viewControllers.count > 1 {
            if let navigationController = splitViewController.viewControllers[1] as? UINavigationController,
                let detailViewController = navigationController.visibleViewController as? HouseDetailViewController {
                detailViewController.house = house
            }
        } else {
            let houseDetailVC = HouseDetailViewController.init(house: house)
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
        return houses.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseTableViewCell", for: indexPath) as? HouseTableViewCell {
            cell.setHouse(houses[indexPath.row])
            return cell
        }
        fatalError("Could not create Account cells")
    }


}
