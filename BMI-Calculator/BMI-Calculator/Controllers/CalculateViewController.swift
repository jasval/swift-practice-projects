//
//  CalculateViewController.swift
//
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var bmiUser = User()
    var height:Float?
    var weight:Float?
    
    @IBAction func heightSlider(_ sender: UISlider) {
        height = (sender.value * 100).rounded() / 100
        heightLabel.text = "\(String(format: "%.2f", height ?? 0)) m"
    }
    @IBAction func weightSlider(_ sender: UISlider) {
        weight = (sender.value * 100).rounded() / 100
        weightLabel.text = "\(String(format: "%.1f", weight ?? 0)) Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if weight != nil && height != nil {
            bmiUser.calculateBMI(weight: weight!, height: height!)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        } else {
            let alert = UIAlertController(title: "Missing Information", message: "Please update weight and height", preferredStyle: .alert)
            self.present(alert, animated: true, completion: {
                alert.view.superview?.isUserInteractionEnabled = true
                alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
            })
        }
    }
    @objc func dismissOnTapOutside(){
        self.dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiResults = bmiUser.getBmi()
            destinationVC.advice = bmiUser.getAdvice()
            destinationVC.color = bmiUser.getColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

