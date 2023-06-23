//
//  SearchViewController.swift
//  musicUIKit
//
//  Created by Natalia Dal Pizzol on 19/06/23.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var musicService: MusicService = try! MusicService()
    var musicCollection: [MusicCollection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        musicCollection = musicService.loadLibrary()
        
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
