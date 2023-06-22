import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UpdateFavoriteSongsDelegate, UISearchResultsUpdating, NotifyTableView {
    
    func receivedNotification() {
        favoriteSongs = MusicService.sharedMusicService.favoriteMusics
        tableView.reloadData()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
            guard let text = searchController.searchBar.text else { return }
                print(text)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var favoriteSongs: [Music] = []
    var musicService = MusicService()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteSongs = musicService.getAllMusics() 
        tableView.dataSource = self
        tableView.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Artists, Songs, Lyrics, and More"
        navigationItem.searchController = searchController
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
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteMusicCell", for: indexPath) as? FavTableViewCell

            cell?.delegate = self
            cell?.musicService = musicService
            cell?.music = favoriteSong
            cell?.favoriteImage.image =  musicService.getCoverImage(forItemIded: favoriteSong.id)
            cell?.favoriteTitle.text = favoriteSong.title
            cell?.favoriteArtist.text = favoriteSong.artist
            cell?.favoriteButton.setImage(heart, for: .normal)
            return cell ?? UITableViewCell()
        }
    }
    
    private func reloadData() {
        self.favoriteSongs = self.musicService.favoriteMusics
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteSongs = musicService.favoriteMusics
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToPlaying", sender: favoriteSongs[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPlaying" {
            guard let view = segue.destination as? PlayingViewController else {return}
            guard let music = sender as? Music else {return}
            view.music = music
            view.delegate = self
        }
    }
    
    func updateFavorites() {
        favoriteSongs = MusicService.sharedMusicService.favoriteMusics
        self.tableView.reloadData()
    }

    
}

//extension FavoritesViewController: favTableViewCellDelegate {
//    func didTapFavoriteButton(music: Music) {
//        print("updated")
//        musicService.toggleFavorite(music: music, isFavorite: false)
//        self.reloadData()
//    }

