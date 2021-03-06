//
//  HouseDetailViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 20/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit
import AVFoundation

class HouseDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    

    
    var house: House? {
        didSet {
            self.title = self.house?.name
            self.tableView.reloadData()
            self.Sound() // En iPad funciona aquí
        }
    }
    
    convenience init(house: House) {
        self.init(nibName: "HouseDetailViewController", bundle: nil)
        self.title = house.name
        self.house = house
        self.Sound() // En iPhone funciona aquí
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    let wingsSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Wings", ofType: "m4a")!)
    var audioPlayer = AVAudioPlayer()

    func Sound() {
        do {
             audioPlayer = try AVAudioPlayer(contentsOf: wingsSound)
             audioPlayer.play()
        } catch {
           // couldn't load file :(
        }
    }
    
    // MARK: - SetUp Functions
    
    func setupUI() {
        self.title = "House Details"
        
        let nib1 = UINib.init(nibName: "ImageTableViewCell", bundle: nil)
        self.tableView.register(nib1, forCellReuseIdentifier: "ImageTableViewCell")
        let nib2 = UINib.init(nibName: "MainAttributesTableViewCell", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "MainAttributesTableViewCell")
        let nib3 = UINib.init(nibName: "SecondaryAttributesTableViewCell", bundle: nil)
        self.tableView.register(nib3, forCellReuseIdentifier: "SecondaryAttributesTableViewCell")
    }

    // VAMOS A CAMBIAR EL COLOR DEL FONDO DE LA CABECERA DE LA SECCION Y YA DE PASO AÑADIMOS EL TITULO
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
      let headerView = UIView(frame: CGRect(x: 0, y: 0, width:tableView.bounds.size.width, height: 45))
        headerView.backgroundColor = UIColor(patternImage: UIImage(named: "houses.png")!).withAlphaComponent(0.1)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width:tableView.bounds.size.width, height: 45))
        label.textColor = UIColor.white
        label.textAlignment = .center

      if (section == 0) {
        label.text = NSLocalizedString("House Image", comment: "House Image")
      } else {
        label.text = NSLocalizedString("House Atributes", comment: "House Atributes")
      }
        headerView.addSubview(label)
      return headerView
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
            case 0:
                sectionName = NSLocalizedString("House Image", comment: "House Image")
            case 1:
                sectionName = NSLocalizedString("House Atributes", comment: "House Atributes")
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
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell {
            
                    cell.cellImage.image = UIImage.init(named: self.house?.name ?? "title")
                    return cell
                }
                fatalError("Could not create Account cells")
        } else {
            if indexPath.row == 0 {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "MainAttributesTableViewCell", for: indexPath) as? MainAttributesTableViewCell {
                        cell.mainAttribute.text = "Seat of this House: \(house?.seat ?? "Select a House in The List !")"
                        return cell
                    }
                    fatalError("Could not create Account cells")
            } else {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "SecondaryAttributesTableViewCell", for: indexPath) as? SecondaryAttributesTableViewCell {
                        cell.secondaryAttribute.text = "Words of this House: \(house?.words ?? "Select a House in The List !")"
                        cell.secondaryAttribute.textAlignment = .center
                        return cell
                    }
                    fatalError("Could not create Account cells")
            }

        }

    }
    
}
