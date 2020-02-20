//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 13/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CastTableViewCellDelegate {
    

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var cast: [Cast] = [Cast.init(id: 1, avatar: "Emilia Clarke", fullname: "Emilia Clarke", role: "Daenerys Targaryen", episodes: 73, birth: "1986-10-23", placeBirth: "London, England, UK"), Cast.init(id: 2, avatar: "Kit Harington", fullname: "Kit Harington", role: "Jon Snow", episodes: 73, birth: "1986-12-26", placeBirth: "Worcester, Worcestershire, England, UK")]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData()
    }
    
    
    deinit {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
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
    
    // MARK: - Setup functions
    
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    func setupUI() {
        self.title = "Cast"
        let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "cast", withExtension: "json") {
        do {
        let data = try Data.init(contentsOf: pathURL)
        let decoder = JSONDecoder()
        cast = try decoder.decode([Cast].self, from: data)
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as? CastTableViewCell {
            cell.setCast(cast[indexPath.row])
            cell.delegate = self
            return cell
        }
        fatalError("Could not create Account cells")
    }
    
    // MARK: - Favorites
    
    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
        
    }
}
