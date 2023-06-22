//
//  PlaylistsViewController.swift
//  musicUIKit
//
//  Created by Leandro Silva on 21/06/23.
//

import UIKit

class PlaylistsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var musicConlletcion: [MusicCollection]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicConlletcion?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = musicConlletcion?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageLabelCell", for: indexPath) as! PlaylistsArtistsTableViewCell
        
        cell.textAlbum.text = music?.mainPerson
        cell.imageAlbum.image = UIImage(named: music?.id ?? " ")
        return cell
    }
}
