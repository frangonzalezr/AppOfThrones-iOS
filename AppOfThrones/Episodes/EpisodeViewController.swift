//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 13/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RateViewControllerDelegate {


    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func seasonChanged(_ sender: UISegmentedControl) {
        let seasonNumber = sender.selectedSegmentIndex + 1
        self.setupData(seasonNumber: seasonNumber)
    
    }
    var episodes: [Episode] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData(seasonNumber: 1)
    
    }
   
    // MARK: - Setup
    
    
    func setupUI() {
        self.title = "Seasons"
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRateChanged), name: noteName, object: nil)
    }
    
    func setupData(seasonNumber: Int) {
        if let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json") {
        do {
        let data = try Data.init(contentsOf: pathURL)
        let decoder = JSONDecoder()
        episodes = try decoder.decode([Episode].self, from: data)
            self.tableView.reloadData()
        } catch {
            fatalError(error.localizedDescription)
        }
        } else {
            fatalError("Could not build the parh url")
        }
    }
    
    @IBAction func openRate(_ sender: Any) {
        // Código para abrir la pantalla rate
        
        let rateViewController = RateViewController()
        rateViewController.modalPresentationStyle = .fullScreen
        self.present(rateViewController, animated: true, completion: nil)
        
    }
    
        // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rateViewController = RateViewController()
        self.present(rateViewController, animated: true, completion: nil)
        print("Estamos seleccionando la tabla en la celda \(indexPath.row) de la sección \(indexPath.section)")
        tableView.deselectRow(at: indexPath, animated: true)
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            
            let ep = episodes[indexPath.row]
            cell.setEpisode(ep)
            cell.rateBlock = { () -> Void in
                let rateViewController = RateViewController.init(withEpisode: ep)
                rateViewController.delegate = self
                let navigationController = UINavigationController.init(rootViewController: rateViewController)
                self.present(navigationController, animated: true, completion: nil)
            }
            return cell
        }
        fatalError("Could not create Account cells")
    }
    
    // MARK: - RateViewControllerDelegate
    
    @objc func didRateChanged() {
        self.tableView.reloadData()
    }

    
}

