//
//  HouseDetailViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 20/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sigil: UILabel!
    @IBOutlet weak var words: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    

    
    var house: House? {
        didSet {
            self.title = self.house?.name
            sigil.text = self.house?.seat
            words.text = self.house?.words
            self.tableView.reloadData()
        }
    }
    
    convenience init(house: House) {
        self.init(nibName: "HouseDetailViewController", bundle: nil)
        self.title = house.name
        self.house = house
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.setupUI()
    }
    
    // MARK: - SetUp Functions
    
    func setupUI() {
        self.title = "House Details"
        
        let nib1 = UINib.init(nibName: "HouseImageTableViewCell", bundle: nil)
        self.tableView.register(nib1, forCellReuseIdentifier: "HouseImageTableViewCell")
        let nib2 = UINib.init(nibName: "HouseSeatTableViewCell", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "HouseSeatTableViewCell")
        let nib3 = UINib.init(nibName: "HouseWordsTableViewCell", bundle: nil)
        self.tableView.register(nib3, forCellReuseIdentifier: "HouseWordsTableViewCell")
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
            case 0:
                sectionName = NSLocalizedString("House Image", comment: "House Image")
            case 1:
                sectionName = NSLocalizedString("House Atributes", comment: "House Atributes")
            // ...
            default:
                sectionName = ""
        }
        return sectionName
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 375
        } else {
            return 50
        }
        
    }

    
    // MARK: - UITableViewDatasource
    
    
    
    let numberOfRowsAtSection: [Int] = [1, 2]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        var rows: Int = 0

        if section < numberOfRowsAtSection.count {
            rows = numberOfRowsAtSection[section]
        }

        return rows
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        if indexPath.section == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseImageTableViewCell", for: indexPath) as? HouseImageTableViewCell {
            
                    cell.avatar.image = UIImage.init(named: self.house?.name ?? "")
                    return cell
                }
                fatalError("Could not create Account cells")
        } else {
            if indexPath.row == 0 {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseSeatTableViewCell", for: indexPath) as? HouseSeatTableViewCell {
                
                        cell.houseSeat.text = house?.seat
                        return cell
                    }
                    fatalError("Could not create Account cells")
            } else {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseWordsTableViewCell", for: indexPath) as? HouseWordsTableViewCell {
                
                        cell.houseWords.text = house?.words
                        return cell
                    }
                    fatalError("Could not create Account cells")
            }

        }

    }
    
}
