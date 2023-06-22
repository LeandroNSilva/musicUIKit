//
//  SongsViewController.swift
//  musicUIKit
//
//  Created by Leandro Silva on 20/06/23.
//

import UIKit

class SongsViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allSongs: [Music]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSongs?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        
        let currentCell = allSongs?[indexPath.row]
        
        var configuration = cell.defaultContentConfiguration()
        
        configuration.text = currentCell?.title
        configuration.secondaryText = currentCell?.artist
        configuration.image = UIImage(named: allSongs?[indexPath.row].id ?? " ")
        
        cell.contentConfiguration = configuration
        return cell
    }
    
}
