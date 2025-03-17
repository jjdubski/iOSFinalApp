//
//  MainViewController.swift
//  FinalApp
//
//  Created by Jacob Waksmanski on 3/6/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var ImageView1: UIImageView!
    
    @IBOutlet weak var TitleLabel1: UILabel!
    
    @IBOutlet weak var ArtistLabel1: UILabel!
    
    @IBOutlet weak var ImageView2: UIImageView!
    
    @IBOutlet weak var TitleLabel2: UILabel!
    
    @IBOutlet weak var ArtistLabel2: UILabel!
    
    @IBOutlet weak var ImageView3: UIImageView!
    
    @IBOutlet weak var TitleLabel3: UILabel!
    
    @IBOutlet weak var ArtistLabel3: UILabel!
        
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    @IBOutlet weak var SongView: UIView!
    
    @IBOutlet weak var SongView2: UIView!
    
    @IBOutlet weak var SongView3: UIView!
    
    @IBOutlet weak var ArtistImage1: UIImageView!
    @IBOutlet weak var ArtistImage2: UIImageView!
    @IBOutlet weak var ArtistImage3: UIImageView!
    
    
    @IBOutlet weak var FeaturedArtistLabel1: UILabel!
    @IBOutlet weak var FeaturedArtistLabel2: UILabel!
    @IBOutlet weak var FeaturedArtistLabel3: UILabel!
    
    var featuredSongs: [Song] = []
    
    var featuredArtists = [
        "Taylor Swift",
        "Justin Bieber",
        "Central Cee",
        "Bad Bunny",
        "Drake",
        "The Weeknd"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        SongView.layer.cornerRadius = 20
        SongView2.layer.cornerRadius = 20
        SongView3.layer.cornerRadius = 20
        
        
        ImageView1.layer.cornerRadius = 20
        ImageView1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]

        ImageView2.layer.cornerRadius = 20
        ImageView2.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        ImageView3.layer.cornerRadius = 20
        ImageView3.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]

        Button1.tag = 0
        Button2.tag = 1
        Button3.tag = 2
        
        let shuffledSongs = songs.shuffled()
        featuredSongs = [shuffledSongs[0], shuffledSongs[1], shuffledSongs[2]]
        
        
        configureFeaturedButton(imageView: ImageView1, titleLabel: TitleLabel1, artistLabel: ArtistLabel1, song: featuredSongs[0])
        configureFeaturedButton(imageView: ImageView2, titleLabel: TitleLabel2, artistLabel: ArtistLabel2, song: featuredSongs[1])
        configureFeaturedButton(imageView: ImageView3, titleLabel: TitleLabel3, artistLabel: ArtistLabel3, song: featuredSongs[2])
        
        let shuffledArtists = featuredArtists.shuffled()
        configureFeaturedArtist(imageView: ArtistImage1, nameLabel: FeaturedArtistLabel1, artistName: shuffledArtists[0])
        configureFeaturedArtist(imageView: ArtistImage2, nameLabel: FeaturedArtistLabel2, artistName: shuffledArtists[1])
        configureFeaturedArtist(imageView: ArtistImage3, nameLabel: FeaturedArtistLabel3, artistName: shuffledArtists[2])
    }
    
    private func configureFeaturedButton(
        imageView: UIImageView,
        titleLabel: UILabel,
        artistLabel: UILabel,
        song: Song
    ) {
        titleLabel.text = song.title
        artistLabel.text = song.artist
        
        let imageName = song.album.lowercased().replacingOccurrences(of: " ", with: "-")
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        
        imageView.clipsToBounds = true
        
    }
    
    private func configureFeaturedArtist(
        imageView: UIImageView,
        nameLabel: UILabel,
        artistName: String
    ) {
        nameLabel.text = artistName
        
        let imageName = artistName.lowercased().replacingOccurrences(of: " ", with: "-")
        imageView.image = UIImage(named: imageName)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2 
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("Button1 tapped")
            performSegue(withIdentifier: "song1", sender: self)
        case 1:
            print("Button2 tapped")
            performSegue(withIdentifier: "song2", sender: self)
        case 2:
            print("Button3 tapped")
            performSegue(withIdentifier: "song3", sender: self)
        default:
            break
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "song1"{
            if let target = segue.destination as?
                SongDetailsViewController{
                target.song = featuredSongs[0]
            }
        }
        if segue.identifier == "song2"{
            if let target = segue.destination as?
                SongDetailsViewController{
                target.song = featuredSongs[1]
            }
        }
        if segue.identifier == "song3"{
            if let target = segue.destination as?
                SongDetailsViewController{
                target.song = featuredSongs[2]
            }
        }
        
       
    }
}
