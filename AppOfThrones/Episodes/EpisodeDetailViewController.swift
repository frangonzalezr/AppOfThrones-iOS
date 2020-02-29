//
//  EpisodeDetailViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 10/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit
import AVFoundation

class EpisodeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    

    
    var episode: Episode? {
        didSet {
            self.title = self.episode?.name
            self.tableView.reloadData()
            self.Sound() // En iPad funciona aquí
        }
    }
    
    convenience init(episode: Episode) {
        self.init(nibName: "EpisodeDetailViewController", bundle: nil)
        self.title = episode.name
        self.episode = episode
        self.Sound() // En iPhone funciona aquí
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    
    let dragonSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Dragon", ofType: "m4a")!)
    var audioPlayer = AVAudioPlayer()

    func Sound() {
        do {
             audioPlayer = try AVAudioPlayer(contentsOf: dragonSound)
             audioPlayer.play()
        } catch {
           // couldn't load file :(
        }
    }
    
    // MARK: - SetUp Functions
    
    func setupUI() {
        self.title = "Episode Details"
        
        let nib1 = UINib.init(nibName: "EpisodeImageTableViewCell", bundle: nil)
        self.tableView.register(nib1, forCellReuseIdentifier: "EpisodeImageTableViewCell")
        let nib2 = UINib.init(nibName: "EpisodeDateSeasonTableViewCell", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "EpisodeDateSeasonTableViewCell")
        let nib3 = UINib.init(nibName: "EpisodeOverviewTableViewCell", bundle: nil)
        self.tableView.register(nib3, forCellReuseIdentifier: "EpisodeOverviewTableViewCell")
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
        label.text = NSLocalizedString("Episode Image", comment: "Episode Image")
      } else {
        label.text = NSLocalizedString("Episode Atributes", comment: "Episode Atributes")
      }
        headerView.addSubview(label)
      return headerView
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
            case 0:
                sectionName = NSLocalizedString("Episode Image", comment: "Episode Image")
            case 1:
                sectionName = NSLocalizedString("Episode Atributes", comment: "Episode Atributes")
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
            return 100
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
                if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeImageTableViewCell", for: indexPath) as? EpisodeImageTableViewCell {
            
                    cell.episodeImage.image = UIImage.init(named: self.episode?.image ?? "title")
                    return cell
                }
                fatalError("Could not create Account cells")
        } else {
            if indexPath.row == 0 {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDateSeasonTableViewCell", for: indexPath) as? EpisodeDateSeasonTableViewCell {
                            
                        if let date = episode?.date {
                            let season = episode?.season
                            cell.seasonDate.text = "Episode from season \(season ?? 0) watched on \(date )"
                        }
                        return cell
                    }
                    fatalError("Could not create Account cells")
            } else {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeOverviewTableViewCell", for: indexPath) as? EpisodeOverviewTableViewCell {
                        cell.name.text = episode?.name
                        cell.overview.text = episode?.overview ?? "Select Episode in The List !"
                        return cell
                    }
                    fatalError("Could not create Account cells")
            }

        }

    }
    
    
}
