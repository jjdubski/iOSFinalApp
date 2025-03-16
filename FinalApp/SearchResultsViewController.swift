//
//  SearchResultsViewController.swift
//  FinalApp
//
//  Created by Serhat Cingilli on 3/15/25.
//

import UIKit

class SearchResultsViewController: UIViewController {
    var song: Song?
    
    @IBOutlet weak var ResultsTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SongImage: UIImageView!
    
    @IBOutlet weak var ArtistLabel: UILabel!
    @IBOutlet weak var SongView1: UIView!
    @IBOutlet weak var HomeButton: UIButton!
    
    
    @IBOutlet weak var MoreFromLabel: UILabel!
    
    @IBOutlet weak var RelatedView1: UIView!
    @IBOutlet weak var RelatedTitle1: UILabel!
    @IBOutlet weak var RelatedAlbum1: UILabel!
    
    @IBOutlet weak var RelatedView2: UIView!
    @IBOutlet weak var RelatedTitle2: UILabel!
    @IBOutlet weak var RelatedAlbum2: UILabel!
    
    @IBOutlet weak var RelatedView3: UIView!
    @IBOutlet weak var RelatedTitle3: UILabel!
    @IBOutlet weak var RelatedAlbum3: UILabel!
    
    @IBOutlet weak var PlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ResultsTitle.text = "Results for \"\(song?.title ?? "No Song")\""
        TitleLabel.text = song?.title ?? "No Song"
        ArtistLabel.text = song?.artist ?? "No Artist"
        
        SongView1.layer.cornerRadius = 20
        SongImage.layer.cornerRadius = 20
        SongImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        SongImage.clipsToBounds = true
        
        if let song = song {
            let imageName = song.album.lowercased().replacingOccurrences(of: " ", with: "-")
            SongImage.image = UIImage(named: imageName)
            SongImage.contentMode = .scaleAspectFit
        }
        
        MoreFromLabel.text = "More From \"\(song?.artist ?? "No Artist")\""
        
        RelatedTitle1.text = song?.relatedSongs[0].title
        RelatedAlbum1.text = song?.relatedSongs[0].album
        
        RelatedTitle2.text = song?.relatedSongs[1].title
        RelatedAlbum2.text = song?.relatedSongs[1].album
        
        RelatedTitle3.text = song?.relatedSongs[2].title
        RelatedAlbum3.text = song?.relatedSongs[2].album
        
        RelatedView1.layer.cornerRadius = 10
        RelatedView2.layer.cornerRadius = 10
        RelatedView3.layer.cornerRadius = 10
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        guard let song = song else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let playerVC = storyboard.instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerViewController {
            playerVC.song = song
            playerVC.modalPresentationStyle = .fullScreen
            present(playerVC, animated: true)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: true)
    }
}
