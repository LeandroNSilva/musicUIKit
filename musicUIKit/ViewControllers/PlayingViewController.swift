//
//  PlayingViewController.swift
//  musicUIKit
//
//  Created by Natalia Dal Pizzol on 22/06/23.
//

import UIKit

class PlayingViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var songCover: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    
    var music: Music?
    var favorites: [Music]  = MusicService.sharedMusicService.favoriteMusics
    weak var delegate: UpdateFavoriteSongsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let music = music else { return }
        songCover.image = UIImage(named: music.id)
        songTitle.text = music.title
        artistName.text = music.artist
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.updateFavorites()
    }
    
    func updateButton() {
        if music!.isFavorite() {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    
}

protocol UpdateFavoriteSongsDelegate: AnyObject {
    func updateFavorites()
    
}
