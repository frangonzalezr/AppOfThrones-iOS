//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 09/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EpisodeTableViewCellDelegate {
    
    
    @IBOutlet weak var seasonSegmented: UISegmentedControl!
    @IBOutlet weak var table: UITableView!
    
    var episodes: [Episode] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData(season: 1)
    }
    
    deinit {
        let noteName = Notification.Name(rawValue: "DidRatesUpdated")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        table.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    // MARK: - Setup
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidRatesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRateChanged), name: noteName, object: nil)
    }
    
    func setupUI() {
        self.title = "Seasons"
        
        seasonSegmented.selectedSegmentTintColor = UIColor.black.withAlphaComponent(0.75)
        seasonSegmented.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        seasonSegmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.75)], for: .normal)
        self.navigationController?.navigationBar.barTintColor = UIColor.black.withAlphaComponent(0.1)
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
    }
    
    func setupData(season: Int) {
        if let pathURL = Bundle.main.url(forResource: "season_\(season)", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                episodes = try decoder.decode([Episode].self, from: data)
                table.reloadData()
            } catch {
                fatalError("Could not read the JSON")
            }
        } else {
            fatalError("Could not build the path url")
        }
    }
    
    // MARK: - IBActions

    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        print("Temporada seleccionada \(sender.selectedSegmentIndex+1)")
        let season = sender.selectedSegmentIndex+1
        self.setupData(season: season)
        self.table.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let episode = episodes[indexPath.row]
        
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
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = episodes[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            cell.setEpisode(episode)
            cell.delegate = self
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
    
    // MARK: - EpisodeTableViewCellDelegate
    
    func didFavoriteChanged() {
        table.reloadData()
    }
    
    // MARK: - RateViewControllerDelegate
    
    @objc func didRateChanged() {
        table.reloadData()
    }
}
