//
//  EmptyTableViewCell.swift
//  musicUIKit
//
//  Created by Natalia Dal Pizzol on 22/06/23.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var emptyTitle: UILabel!
    @IBOutlet weak var emptyImage: UIImageView!
    @IBOutlet weak var emptySub: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
