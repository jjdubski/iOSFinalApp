//
//  PlayerViewController.swift
//  FinalApp
//
//  Created by Jacob Waksmanski on 3/10/25.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var playIcon: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var PlayerImage: UIImageView!
    @IBOutlet weak var PlayerTitle: UILabel!
    @IBOutlet weak var PlayerArtist: UILabel!


    var songList: [Song] = []
    var song: Song?
    var timer: Timer?
    var sectionViews: [UIView] = []
    var sectionViewHeights: [CGFloat] = []
    var player: AVAudioPlayer?
    var currentPlaybackTime: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let rectangleHeight: CGFloat = 3
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0.55*screenHeight, width: screenWidth, height: rectangleHeight))
        lineView.backgroundColor = .white

        self.view.addSubview(lineView)

        if let song = song {
            PlayerTitle.text = song.title
            PlayerArtist.text = song.artist
            
            let imageName = song.album.lowercased().replacingOccurrences(of: " ", with: "-")
            PlayerImage.image = UIImage(named: imageName)
            PlayerImage.contentMode = .scaleAspectFit
            PlayerImage.layer.cornerRadius = 10
            PlayerImage.clipsToBounds = true
            
            songList = songs.filter { $0 != song }
            songList.insert(song, at: 0)
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
            case playButton.tag:
                print("Play button tapped")
                if playIcon.image == UIImage(systemName: "play.fill") {
                    setSectionViews()
                    playIcon.image = UIImage(systemName: "pause.fill")
                    playMusic()
                    startTimer()
                } else {
                    hideSectionViews()
                    playIcon.image = UIImage(systemName: "play.fill")
                    stopTimer()
                    if player?.isPlaying == true{
                        currentPlaybackTime = player?.currentTime ?? 0
                        player?.pause()
                        // player?.stop()
                    }
                }
            case skipButton.tag:
                print("Skip button tapped")
                playNextSong()
            case backButton.tag:
                print("Backwards button tapped")
                playPreviousSong()
            default:
                break
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        player?.stop()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSectionHeights), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateSectionHeights() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        for (i, sectionView) in sectionViews.enumerated() {
            let sectionWidth = screenWidth / 10
            let currentHeight = sectionView.frame.height
            let randomAdjustment = CGFloat(arc4random_uniform(41)) - 20
            let newHeight = max(50, min(150, currentHeight + randomAdjustment))
            sectionView.frame = CGRect(x: CGFloat(i)*sectionWidth, y: 0.55*screenHeight - newHeight, width: sectionWidth, height: newHeight)
        }
    }

    func hideSectionViews() {
        sectionViewHeights = sectionViews.map { $0.frame.height }
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        for (i, sectionView) in sectionViews.enumerated() {
            let sectionWidth = screenWidth / 10
            sectionView.frame = CGRect(x: CGFloat(i)*sectionWidth, y: 0.55*screenHeight, width: sectionWidth, height: 0)
        }
    }

    func setSectionViews() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let sectionWidth = screenWidth / 10
        
        for sectionView in sectionViews {
            sectionView.removeFromSuperview()
        }
        sectionViews.removeAll()
        
        if sectionViewHeights.isEmpty {
            sectionViewHeights = (0..<10).map { _ in CGFloat(arc4random_uniform(150) + 50) }
        }
        
        for i in 0..<10 {
            let sectionHeight = sectionViewHeights[i]
            let sectionView = UIView(frame: CGRect(x: CGFloat(i)*sectionWidth, y: 0.55*screenHeight - sectionHeight, width: sectionWidth, height: sectionHeight))
            let colorValue = CGFloat(i) * 0.1
            sectionView.backgroundColor = UIColor(red: 0.0 + (colorValue/2), green: 0.25 + (colorValue/2), blue: 1.0, alpha: 1.0)
            self.view.addSubview(sectionView)
            sectionViews.append(sectionView)
        }
    }
    
    func playMusic(){
        if let title = PlayerTitle.text {
            if let soundURL =  Bundle.main.url(forResource: title, withExtension: "mp3") {
                do {
                    player = try AVAudioPlayer(contentsOf: soundURL)
                    player?.currentTime = currentPlaybackTime
                    player?.play()
                } catch {
                    print("Player error: \(error)")
                }
            }
        }
    }

    func playNextSong() {
        if let currentSong = song, let currentIndex = songs.firstIndex(of: currentSong) {
            let nextIndex = (currentIndex + 1) % songs.count
            song = songs[nextIndex]
            currentPlaybackTime = 0
            updateUI(with: song!)
            playMusic()
        }
    }
    
    func playPreviousSong() {
        if let currentSong = song, let currentIndex = songs.firstIndex(of: currentSong) {
            let previousIndex = (currentIndex - 1 + songs.count) % songs.count
            song = songs[previousIndex]
            currentPlaybackTime = 0
            updateUI(with: song!)
            playMusic()
        }
    }
    
    func updateUI(with song: Song) {
        PlayerTitle.text = song.title
        PlayerArtist.text = song.artist
        
        let imageName = song.album.lowercased().replacingOccurrences(of: " ", with: "-")
        PlayerImage.image = UIImage(named: imageName)
        PlayerImage.contentMode = .scaleAspectFit
        PlayerImage.layer.cornerRadius = 10
        PlayerImage.clipsToBounds = true
    }
}
