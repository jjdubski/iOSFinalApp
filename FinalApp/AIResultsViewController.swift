//
//  AIResultsViewController.swift
//  FinalApp
//
//  Created by Serhat Cingilli on 3/16/25.
//

import UIKit

class AIResultsViewController: UIViewController {
    var artist: ArtistInfo?
    @IBOutlet weak var ArtistPageTitle: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var HomeButton: UIButton!
    
    @IBOutlet weak var AiResultView2: UIView!
    @IBOutlet weak var AiResultTitle2: UILabel!
    @IBOutlet weak var AiResultGenre2: UILabel!
    @IBOutlet weak var AiResultListeners2: UILabel!
    
    @IBOutlet weak var AiResultView3: UIView!
    @IBOutlet weak var AiResultTitle3: UILabel!
    @IBOutlet weak var AiResultGenre3: UILabel!
    @IBOutlet weak var AiResultListeners3: UILabel!
    
    @IBOutlet weak var AiResultView4: UIView!
    @IBOutlet weak var AiResultTitle4: UILabel!
    @IBOutlet weak var AiResultGenre4: UILabel!
    @IBOutlet weak var AiResultListeners4: UILabel!
    
    @IBOutlet weak var AiResultView5: UIView!
    @IBOutlet weak var AiResultTitle5: UILabel!
    @IBOutlet weak var AiResultGenre5: UILabel!
    @IBOutlet weak var AiResultListeners5: UILabel!
    
    private var similarArtists: [(artist: ArtistInfo, score: Double)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AiResultView2?.layer.cornerRadius = 15
        AiResultView3?.layer.cornerRadius = 15
        AiResultView4?.layer.cornerRadius = 15
        AiResultView5?.layer.cornerRadius = 15
        
        ArtistPageTitle.text = "Artist(s) similar to \(artist?.name ?? "")"
        
        findSimilarArtists()
        displaySimilarArtists()
    }

    
    private func findSimilarArtists() {
        if artist == nil {
            return
        }
        
        similarArtists = artistDatabase.filter { 
            $0.name != artist!.name 
        }.map { otherArtist -> (artist: ArtistInfo, score: Double) in
            let score = calculateSimilarityScore(between: artist!, and: otherArtist)
            return (artist: otherArtist, score: score)
        }.sorted { $0.score > $1.score }
        
        similarArtists = Array(similarArtists.prefix(5))
    }
    
    private func calculateSimilarityScore(between artist1: ArtistInfo, and artist2: ArtistInfo) -> Double {

        var score: Double = 0.0
        
        if artist1.genre == artist2.genre {
            score += 60.0
        }
        
        let yearDifference = abs(artist1.yearFormed - artist2.yearFormed)
        if yearDifference <= 5 {
            score += 20.0
        } else if yearDifference <= 10 {
            score += 15.0
        } else if yearDifference <= 15 {
            score += 10.0
        } else if yearDifference <= 20 {
            score += 5.0
        }
        
        let listenerDifferencePercent = abs(Double(artist1.monthlyListeners - artist2.monthlyListeners)) / 
                                         Double(max(artist1.monthlyListeners, artist2.monthlyListeners))
        
        if listenerDifferencePercent <= 0.1 {  
            score += 20.0
        } else if listenerDifferencePercent <= 0.25 {  
            score += 15.0
        } else if listenerDifferencePercent <= 0.5 {  
            score += 10.0
        } else if listenerDifferencePercent <= 0.75 {  
            score += 5.0
        }
        
        return score
    }
    
    private func displaySimilarArtists() {
        let resultViews = [

            (AiResultView2, AiResultTitle2, AiResultGenre2, AiResultListeners2),
            (AiResultView3, AiResultTitle3, AiResultGenre3, AiResultListeners3),
            (AiResultView4, AiResultTitle4, AiResultGenre4, AiResultListeners4),
            (AiResultView5, AiResultTitle5, AiResultGenre5, AiResultListeners5)
        ]
        
        for i in 0..<resultViews.count {
            if i < similarArtists.count {
                let similarArtist = similarArtists[i]
                let (view, nameLabel, genreLabel, listenersLabel) = resultViews[i]
                
                view?.isHidden = false
                nameLabel?.text = similarArtist.artist.name
                genreLabel?.text = similarArtist.artist.genre
                
                let matchPercent = Int(similarArtist.score)
                
                var listenersText = ""
                let listeners = similarArtist.artist.monthlyListeners
                if listeners >= 1000000 {
                    let millions = Double(listeners) / 1000000.0
                    listenersText = String(format: "%.1fM listeners • ", millions)
                } else if listeners >= 1000 {
                    let thousands = Double(listeners) / 1000.0
                    listenersText = String(format: "%.1fK listeners • ", thousands)
                } else {
                    listenersText = "\(listeners) listeners • "
                }
                
                listenersLabel?.text = "\(listenersText)\(matchPercent)% match"
            }
        }
    }
    
    @IBAction func BackButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func HomeButtonPressed(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: true)

    }
}
