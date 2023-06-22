 //
//  LibraryViewController.swift
//  musicUIKit
//
//  Created by Natalia Dal Pizzol on 19/06/23.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    let songsSegue: String = "goToSongs"
    let playListAndArtist: String = "goToPlaylistAndArtists"

    let musicCollectionTypes: [MusicCollectionType] = MusicCollectionType.allCases
    
    var musicService: MusicService?
    var allSongs: [Music] = []
    var musicCollection: [MusicCollection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Library"
        
        do{
            self.musicService = try MusicService()
            self.musicCollection = musicService?.loadLibrary() ?? []
            self.allSongs = musicService?.getAllMusics() ?? []
        }catch{
            print("erro")
        }
    }
    
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicCollectionTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RightDetail", for: indexPath)
        
        let currentMusicCollectionType = musicCollectionTypes[indexPath.row]
        
        var configuration = cell.defaultContentConfiguration()
        
        configuration.text = currentMusicCollectionType.description
        configuration.image = UIImage(systemName: currentMusicCollectionType.icon)
        
        cell.contentConfiguration = configuration
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentMusicCollectionType = musicCollectionTypes[indexPath.row]
        
        switch currentMusicCollectionType {
        case .artists, .playlist:
            performSegue(withIdentifier: playListAndArtist, sender: musicCollection)
        case .songs:
            performSegue(withIdentifier: songsSegue, sender: allSongs)
        case .album:
            let alertController = UIAlertController(title: "⚠️ CUIDADO ⚠️", message: "Ainda não implementamos essa incrível funcionalidade!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OQUEIJO", style: .default) { _ in self.dismiss(animated: true)
            }
            
            alertController.addAction(okAction)
            
            present(alertController, animated: true)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == songsSegue {
            let songsViewController = segue.destination as! SongsViewController
            
            guard let allSongs = sender as? [Music] else { return }
            
            songsViewController.allSongs = allSongs
            
        }else{
            let playlistAndArtist = segue.destination as! PlaylistsViewController
            
            guard let musicColletcion = sender as? [MusicCollection] else { return }
            
            playlistAndArtist.musicConlletcion = musicColletcion
            playlistAndArtist.musicService = musicService
        }
    }
    
}
