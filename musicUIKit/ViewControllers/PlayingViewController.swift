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
    var fav: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songCover.image = UIImage(named: music?.id)
    }
    



}
