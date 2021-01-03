//
//  landmarkDetailViewController.swift
//  LandmarkBook
//
//  Created by Serhat Küçük on 3.01.2021.
//

import UIKit

class landmarkDetailViewController: UIViewController {
    
    @IBOutlet weak var landmarkLabel: UILabel!
    
    @IBOutlet weak var landmarkImage: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandmarkName
        landmarkImage.image = selectedLandmarkImage

    }
    

   

}
