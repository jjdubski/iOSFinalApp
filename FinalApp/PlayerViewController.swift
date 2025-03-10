//
//  PlayerViewController.swift
//  FinalApp
//
//  Created by Jacob Waksmanski on 3/10/25.
//

import UIKit

class PlayerViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let rectangleHeight: CGFloat = 3
        
        let rectangleView = UIView(frame: CGRect(x: 0, y: 0.6*screenHeight, width: screenWidth, height: rectangleHeight))
        rectangleView.backgroundColor = .white  // Change color as needed
        
        self.view.addSubview(rectangleView)
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
