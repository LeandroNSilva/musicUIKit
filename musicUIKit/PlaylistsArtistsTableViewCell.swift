//
//  PlaylistsArtistsTableViewCell.swift
//  musicUIKit
//
//  Created by Leandro Silva on 21/06/23.
//

import UIKit

class PlaylistsArtistsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageAlbum: UIImageView!
    @IBOutlet weak var textAlbum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageAlbum.layer.cornerRadius = 12
    }

}
