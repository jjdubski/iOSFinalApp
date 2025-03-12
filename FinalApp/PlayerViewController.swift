//
//  PlayerViewController.swift
//  FinalApp
//
//  Created by Jacob Waksmanski on 3/10/25.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var closeButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let rectangleHeight: CGFloat = 3
        
        let rectangleView = UIView(frame: CGRect(x: 0, y: 0.6*screenHeight, width: screenWidth, height: rectangleHeight))
        rectangleView.backgroundColor = .white
        
        self.view.addSubview(rectangleView)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
