import UIKit

protocol favTableViewCellDelegate: AnyObject {
    func didTapFavoriteButton(music: Music)
}

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteTitle: UILabel!
    @IBOutlet weak var favoriteArtist: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate: favTableViewCellDelegate?
    var musicService: MusicService?
    var music: Music?
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        
        guard let music = music
        else {return}
        
        delegate?.didTapFavoriteButton(music: music)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
