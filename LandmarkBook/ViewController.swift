//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Serhat Küçük on 3.01.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
//       landmarknames array definition
        
        landmarkNames.append("Kız Kulesi")
        landmarkNames.append("Eiffel Tower")
        landmarkNames.append("Big Ben")
        landmarkNames.append("Rio Jesus Statue")
        landmarkNames.append("Liberty Statue")
        
//       landmarkImages array definition
        
        landmarkImages.append(UIImage(named: "kizkulesi")!)
        landmarkImages.append(UIImage(named: "eiffeltower")!)
        landmarkImages.append(UIImage(named: "bigben")!)
        landmarkImages.append(UIImage(named: "riojesusstatue")!)
        landmarkImages.append(UIImage(named: "libertystatue")!)
        
        
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandMarkName = landmarkNames[indexPath.row]
        chosenLandMarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailViewController", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewController"{
            let destinatinCV = segue.destination as! landmarkDetailViewController
            destinatinCV.selectedLandmarkImage = chosenLandMarkImage
            destinatinCV.selectedLandmarkName = chosenLandMarkName
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
        }
       
    }
}

