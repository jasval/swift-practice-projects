//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jose Saldana on 12/05/2020.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total:Float = 0
    var tip:Float = 0
    var split:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "\(round(total*100)/100)"
        if split == 1 {
            settingsLabel.text = "To pay by one person with a \(round((tip*100)-100))% tip."
        } else {
            settingsLabel.text = "Split between \(split) people, with \(round((tip*100)-100))% tip."
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
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
