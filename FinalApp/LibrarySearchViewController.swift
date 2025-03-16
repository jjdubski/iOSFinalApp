//
//  LibrarySearchViewController.swift
//  FinalApp
//
//  Created by Jacob Waksmanski on 3/16/25.
//

import UIKit

class LibrarySearchViewController: UIViewController {
  
    @IBOutlet weak var HistoryView1: UIView!
    @IBOutlet weak var HistoryTitle1: UILabel!
    @IBOutlet weak var HistoryArtist1: UILabel!
    
    @IBOutlet weak var HistoryView2: UIView!
    @IBOutlet weak var HistoryTitle2: UILabel!
    @IBOutlet weak var HistoryArtist2: UILabel!
    
    
    @IBOutlet weak var HistoryView3: UIView!
    @IBOutlet weak var HistoryTitle3: UILabel!
    @IBOutlet weak var HistoryArtist3: UILabel!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var SearchButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet var Background: UIView!
    
    @IBOutlet weak var SearchLabel: UILabel!
    
    private var songToPass: Song?
    
    var searchHistory: [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HistoryView1.layer.cornerRadius = 20
        HistoryView2.layer.cornerRadius = 20
        HistoryView3.layer.cornerRadius = 20
        
        SearchBar.backgroundImage = UIImage()
        SearchBar.backgroundColor = .clear
        
        updateHistoryUI()
    
    }
    
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let query = SearchBar.text?.lowercased() ?? ""
        print("Search query: \(query)")
        
        let filteredSongs = songs.filter { song in
            song.title.lowercased().contains(query)
        }
        print("Filtered songs count: \(filteredSongs.count)")
        
        if let firstSong = filteredSongs.first {
            print("Found matching song: \(firstSong.title)")
            searchHistory.insert(firstSong, at: 0)
            if searchHistory.count > 3 {
                searchHistory.removeLast()
            }
            updateHistoryUI()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
       
            if let resultsVC = storyboard.instantiateViewController(withIdentifier: "SearchResultsViewController") as? SearchResultsViewController {
                resultsVC.song = firstSong
                print("Manually presenting with song: \(firstSong.title)")
                resultsVC.modalPresentationStyle = .fullScreen
                self.present(resultsVC, animated: true)
            }
        } else {
            print("No matching songs found")
            showAlert(title: "No Results", message: "No songs found matching '\(query)'")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowSearchResults" {
            if let resultsVC = segue.destination as? SearchResultsViewController {
                
                if let song = self.songToPass {
                    resultsVC.song = song
                }
            }
        }
    }

    private func updateHistoryUI() {
        let historyViews = [
            (HistoryView1, HistoryTitle1, HistoryArtist1),
            (HistoryView2, HistoryTitle2, HistoryArtist2),
            (HistoryView3, HistoryTitle3, HistoryArtist3)]
        
        for (index, (containerView, titleLabel, artistLabel)) in historyViews.enumerated() {
            if index < searchHistory.count {
                let song = searchHistory[index]
                containerView?.isHidden = false
                titleLabel?.text = song.title
                artistLabel?.text = song.artist
            }
            else{
                containerView?.isHidden = true
            }
        }
    }
        
    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
