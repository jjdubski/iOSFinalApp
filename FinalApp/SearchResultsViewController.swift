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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ResultsTitle.text = song?.title ?? "No Result"
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
