//
//  AISearchViewController.swift
//  FinalApp
//
//  Created by Jacob Waksmanski on 3/16/25.
//

import UIKit

class AISearchViewController: UIViewController {

    @IBOutlet weak var AiSearchBar: UISearchBar!
    
    @IBOutlet weak var AiHistoryView1: UIView!
    @IBOutlet weak var AiHistoryArtist1: UILabel!
    @IBOutlet weak var AiHistoryGenre1: UILabel!
    @IBOutlet weak var AiHistoryYear1: UILabel!
    
    @IBOutlet weak var AiHistoryView2: UIView!
    @IBOutlet weak var AiHistoryArtist2: UILabel!
    @IBOutlet weak var AiHistoryGenre2: UILabel!
    @IBOutlet weak var AiHistoryYear2: UILabel!
    
    @IBOutlet weak var AiHistoryView3: UIView!
    @IBOutlet weak var AiHistoryArtist3: UILabel!
    @IBOutlet weak var AiHistoryGenre3: UILabel!
    @IBOutlet weak var AiHistoryYear3: UILabel!
    
    
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var HomeButton: UIButton!
    
    var searchHistory: [ArtistInfo] = []
    private var artistToPass: ArtistInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AiHistoryView1.layer.cornerRadius = 15
        AiHistoryView2.layer.cornerRadius = 15
        AiHistoryView3.layer.cornerRadius = 15
        
        AiSearchBar.backgroundImage = UIImage()
        AiSearchBar.backgroundColor = .clear
        
        updateHistoryUI()
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let query = AiSearchBar.text?.lowercased() ?? ""
        print("Search query: \(query)")
        
        let filteredArtists = artistDatabase.filter { artist in
            artist.name.lowercased().contains(query)
        }
        print("Filtered artists count: \(filteredArtists.count)")
        
        if let firstArtist = filteredArtists.first {
            print("Found matching artist: \(firstArtist.name)")
            searchHistory.insert(firstArtist, at: 0)
            if searchHistory.count > 3 {
                searchHistory.removeLast()
            }
            updateHistoryUI()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let aiResultsVC = storyboard.instantiateViewController(withIdentifier: "AIResultsViewController") as? AIResultsViewController {
                aiResultsVC.artist = firstArtist
                print("Manually presenting with artist: \(firstArtist.name)")
                aiResultsVC.modalPresentationStyle = .fullScreen
                self.present(aiResultsVC, animated: true)
            }
        } else {
            print("No matching artists found")
            showAlert(title: "No Results", message: "No artists found matching '\(query)'")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAiResults" {
            if let resultsVC = segue.destination as? AIResultsViewController {
                if let artist = self.artistToPass {
                    resultsVC.artist = artist
                }
            }
        }
    }

    private func updateHistoryUI() {
        let historyViews = [
            (AiHistoryView1, AiHistoryArtist1, AiHistoryGenre1, AiHistoryYear1),
            (AiHistoryView2, AiHistoryArtist2, AiHistoryGenre2, AiHistoryYear2),
            (AiHistoryView3, AiHistoryArtist3, AiHistoryGenre3, AiHistoryYear3)
        ]
        
        for (index, (containerView, artistLabel, genreLabel, yearLabel)) in historyViews.enumerated() {
            if index < searchHistory.count {
                let artist = searchHistory[index]
                containerView?.isHidden = false
                artistLabel?.text = artist.name
                genreLabel?.text = artist.genre
                yearLabel?.text = "\(artist.yearFormed)"
            } else {
                containerView?.isHidden = true
            }
        }
    }
        
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
