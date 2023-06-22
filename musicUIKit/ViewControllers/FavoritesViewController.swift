import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteSongs: [Music] = []
    var musicService = try! MusicService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteSongs = musicService.getAllMusics() 
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favoriteSongs.count > 0{
            return favoriteSongs.count
        }
            return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if favoriteSongs.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyFavoriteCell", for: indexPath) as! EmptyTableViewCell

            cell.emptyImage.image = UIImage(systemName: "heart.slash")
            cell.emptyTitle.text = "No favorites"
            cell.emptySub.text = "Save the songs you like and come back here to access them."
            return cell
        }
        
        else {
            let favoriteSong = favoriteSongs[indexPath.row]
            let heart = UIImage(systemName: "heart.fill")
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteMusicCell", for: indexPath) as! FavTableViewCell

            cell.delegate = self
            cell.musicService = musicService
            cell.music = favoriteSong
            cell.favoriteImage.image =  musicService.getCoverImage(forItemIded: favoriteSong.id)
            cell.favoriteTitle.text = favoriteSong.title
            cell.favoriteArtist.text = favoriteSong.artist
            cell.favoriteButton.setImage(heart, for: .normal)
            
            return cell
        }
    }
    
    private func reloadData() {
        self.favoriteSongs = self.musicService.favoriteMusics
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation
}

extension FavoritesViewController: favTableViewCellDelegate {
    func didTapFavoriteButton(music: Music) {
        print("RECARREGOU")
        musicService.toggleFavorite(music: music, isFavorite: false)
        self.reloadData()
    }
}
