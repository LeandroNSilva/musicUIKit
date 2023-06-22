import UIKit

protocol NotifyTableView: AnyObject {
    func receivedNotification()
}


class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteTitle: UILabel!
    @IBOutlet weak var favoriteArtist: UILabel!
    
    
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate: NotifyTableView?
    
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        MusicService.sharedMusicService.toggleFavorite(music: music!, isFavorite: music!.isFavorite())
        delegate?.receivedNotification()
    }
    
    
    var musicService: MusicService?
    var music: Music?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let music = music else {
            return
        }
        if music.isFavorite() {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
