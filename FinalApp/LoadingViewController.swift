//
//  LoadingViewController.swift
//  FinalApp
//
//  Created by Jacob Waksmanski on 3/5/25.
//

import UIKit

class LoadingViewController: UIViewController {


    @IBOutlet weak var bufferIcon: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bufferIcon.startAnimating()

        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(switchToHomeViewController), userInfo: nil, repeats: false)
    }
    
    @objc func switchToHomeViewController() {
        bufferIcon.stopAnimating()
        
        if let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            homeVC.modalTransitionStyle = .crossDissolve
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: true, completion: nil)
        }
    }

}

