//
//  AlbumListViewController.swift
//  InterviewProject
//
//  Created by Matt M Smith on 2/22/22.
//

import UIKit

class AlbumListViewController: UITableViewController {
    
    let music = MusicManager()
    var albums: MusicInfo.Albums? = MusicInfo.Albums()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.NavTitle.tableController
        albums = music.albums
        
        self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return albums?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.id, for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        guard let albumName = albums?[indexPath.row].name else {
            Alert.display(withMessage: .missingTitles, vc: self)
            return UITableViewCell()
        }
        
        content.text = albumName
        
        cell.contentConfiguration = content
        cell.accessibilityIdentifier = Accessibility.id(for: albumName)
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    // MARK: - Navigation

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let album = albums?[indexPath.row] else {
            Alert.display(withMessage: .missingData, vc: self)
            return
        }
        
        if let albumDetailsVC = storyboard?.instantiateViewController(withIdentifier: Constants.DetailsView.id) as? AlbumDetailsViewController {
            albumDetailsVC.albumName = album.name
            albumDetailsVC.imageName = album.imageName
            albumDetailsVC.artist = album.artist
            albumDetailsVC.albumDescription = album.description
            
            navigationController?.pushViewController(albumDetailsVC, animated: true)
        }
    }
}
