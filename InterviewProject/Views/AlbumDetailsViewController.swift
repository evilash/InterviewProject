//
//  AlbumDetailsViewController.swift
//  InterviewProject
//
//  Created by Matt M Smith on 2/23/22.
//

import UIKit

class AlbumDetailsViewController: UIViewController {
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumDescriptionLabel: UILabel!
    
    var albumName = ""
    var artist = ""
    var albumDescription = ""
    var imageName = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpAlbumAndArtist()
        setUpDescription()
        setupAccessibilityIDs()
    }
    
    // MARK: - Setup Functions
    
    private func setUpAlbumAndArtist() {
        title = albumName
        albumCoverImageView.image = UIImage(named: imageName)
        artistLabel.text = artist
    }
    
    private func setUpDescription() {
        let paragraphStyle = NSMutableParagraphStyle()
        let attrString = NSMutableAttributedString(string: albumDescription)
        
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        
        albumDescriptionLabel.attributedText = attrString
        albumDescriptionLabel.numberOfLines = 0
        albumDescriptionLabel.lineBreakMode = .byWordWrapping
    }
    
    private func setupAccessibilityIDs() {
        albumCoverImageView.isAccessibilityElement = true
        albumCoverImageView.accessibilityIdentifier = imageName
        artistLabel.accessibilityIdentifier = Accessibility.id(for: artist)
        albumDescriptionLabel.isAccessibilityElement = false
    }
}
