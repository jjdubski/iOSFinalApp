//
//  PlayerViewController.swift
//  FinalApp
//
//  Created by Jacob Waksmanski on 3/10/25.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var closeButton: UIImageView!  
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playIcon: UIImageView!
    
    @IBOutlet weak var PlayerImage: UIImageView!
    @IBOutlet weak var PlayerTitle: UILabel!
    @IBOutlet weak var PlayerArtist: UILabel!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if let song = song {
            PlayerTitle.text = song.title
            PlayerArtist.text = song.artist
            
            let imageName = song.album.lowercased().replacingOccurrences(of: " ", with: "-")
            PlayerImage.image = UIImage(named: imageName)
            PlayerImage.contentMode = .scaleAspectFit
            PlayerImage.layer.cornerRadius = 10
            PlayerImage.clipsToBounds = true
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if playIcon.image == UIImage(systemName: "play.fill") {
            playIcon.image = UIImage(systemName: "pause.fill")
        } else {
            playIcon.image = UIImage(systemName: "play.fill")
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
