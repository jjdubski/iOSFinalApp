//
//  SongDetailsViewController.swift
//  FinalApp
//
//  Created by Jacob Waksmanski on 3/10/25.
//

import UIKit

class SongDetailsViewController: UIViewController {
    
    var song: Song?
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var longDescription: UILabel!
    
    @IBOutlet weak var songImageView: UIImageView!
    
    
    @IBOutlet weak var closeButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        longDescription.baselineAdjustment = .alignBaselines
        longDescription.lineBreakMode = .byWordWrapping
        
        if let song = song {
            print("Recieved Song: \(song.title)")
        } else{
            print("No song")
        }
        
        
        
        
        if let song = song {
            titleLabel.text = song.title
            artistLabel.text = song.artist
            longDescription.text = song.longDescription
            
            let imageName = song.album.lowercased().replacingOccurrences(of: " ", with: "-")
            songImageView.image = UIImage(named: imageName)
            songImageView.contentMode = .scaleAspectFit
            songImageView.layer.cornerRadius = 10
            songImageView.clipsToBounds = true
        }

    }
    
    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
