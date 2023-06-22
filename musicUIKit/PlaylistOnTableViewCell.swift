//
//  PlaylistOnTableViewCell.swift
//  musicUIKit
//
//  Created by Leandro Silva on 22/06/23.
//

import UIKit

class PlaylistOnTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCollection: UIImageView!
    @IBOutlet weak var titleCollection: UILabel!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var subtittleCollection: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageCollection.layer.cornerRadius = 8
    }
}
