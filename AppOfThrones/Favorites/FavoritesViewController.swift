//
//  FavoritesViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 29/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    

    @IBOutlet weak var table: UITableView!
    
    var episodes: [Episode] = []
    
    var favoriteEpisodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        // Do any additional setup after loading the view.
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
        
        favoriteEpisodes.removeAll()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for seasons in [1,2,3,4,5,6,7,8] {
            self.setupData(season: seasons)
        }
        table.reloadData()
    }
    
    func setupUI() {
        self.title = "Favorite Episodes"
        self.navigationController?.navigationBar.barTintColor = UIColor.black.withAlphaComponent(0.1)
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
    }

        // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }

    func setupData(season: Int) {
        if let pathURL = Bundle.main.url(forResource: "season_\(season)", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                episodes = try decoder.decode([Episode].self, from: data)
                
                for episode in episodes {
                    if DataController.shared.isFavorite(episode) {
                        // COMPRUEBO SI ESTA COMO FAVORITO Y TENGO QUE PASARLO A OTRO ARRAY
                        favoriteEpisodes.append(episode)
                    }
                }
                table.reloadData()
            } catch {
                fatalError("Could not read the JSON")
            }
        } else {
            fatalError("Could not build the path url")
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = favoriteEpisodes[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            cell.setEpisode(episode)
            //cell.delegate = self
            cell.rateBlock = {
                let rateViewController = RateViewController.init(withEpisode: episode)
                let navigationController = UINavigationController.init(rootViewController: rateViewController)
                navigationController.modalPresentationStyle = UIDevice.current.userInterfaceIdiom == .pad ? .formSheet : .fullScreen
                self.present(navigationController, animated: true, completion: nil)
            }
            return cell
        }
        fatalError("Could not create Account cells")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let episode = favoriteEpisodes[indexPath.row]
        
        if let splitViewController = self.splitViewController,
            splitViewController.viewControllers.count > 1 {
            if let navigationController = splitViewController.viewControllers[1] as? UINavigationController,
                let detailViewController = navigationController.visibleViewController as? EpisodeDetailViewController {
                detailViewController.episode = episode
            }
        } else {
            let episodeDetailVC = EpisodeDetailViewController.init(episode: episode)
            self.navigationController?.pushViewController(episodeDetailVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - UITableViewDatasource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteEpisodes.count
    }

}
