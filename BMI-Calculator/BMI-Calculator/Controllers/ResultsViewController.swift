//
//  ResultsViewController.swift
//
//  Created by Jose Saldana on 27/01/2020.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiResults:String?
    var advice:String?
    var color:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        bmiLabel.text = bmiResults ?? "No value"
        view.backgroundColor = color!
        adviceLabel.text = advice
    }
    @IBAction func recalculatePressed(_ sender: Any) {
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
