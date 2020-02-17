//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 13/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var episodes: [Episode] = [Episode.init(id: 1, name: "Winter is coming", date: "13/2/2020", image: "episodeTest", episode: 1, season: 1, overview: "Jon Arryn is coming")]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
    }
    
    func setupUI() {
        self.title = "Seasons"
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
            return cell
        }
        fatalError("Could not create Account cells")
    }
    
    // MARK: - EpisodeTableViewCellDelegate
    

    
}

