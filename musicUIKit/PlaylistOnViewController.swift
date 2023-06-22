//
//  PlaylistOnViewController.swift
//  musicUIKit
//
//  Created by Leandro Silva on 22/06/23.
//

import UIKit

class PlaylistOnViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    enum Section: CaseIterable {
        case artistHeadline
        case musicRow
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var musicService: MusicService?
    
    var sections: [Section] = Section.allCases
    var collection: MusicCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentSection = sections[indexPath.section]
        
        switch currentSection {
        case .artistHeadline:
            return UITableView.automaticDimension
        case .musicRow:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = sections[section]
        
        switch currentSection {
        case .artistHeadline:
            return 1
        case .musicRow:
            return collection?.musics.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = sections[indexPath.section]
        
        switch currentSection {
        case .artistHeadline:
            let currentCell = collection?.musics[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath) as! PlaylistOnTableViewCell
            
            cell.titleCollection.text = currentCell?.title
            cell.subtittleCollection.text = currentCell?.artist
            cell.imageCollection.image = musicService?.getCoverImage(forItemIded: collection?.id ?? " ")
            return cell
            
        case .musicRow:
            let cell = tableView.dequeueReusableCell(withIdentifier: "musicRowCell", for: indexPath)
            
            let currentCell = collection?.musics[indexPath.row]
            
            var configuration = cell.defaultContentConfiguration()
            
            configuration.text = currentCell?.title
            configuration.secondaryText = currentCell?.artist
            configuration.image = UIImage(named: currentCell?.id ?? " ")
            
            cell.contentConfiguration = configuration
            
            return cell
            
        }
    }
}
