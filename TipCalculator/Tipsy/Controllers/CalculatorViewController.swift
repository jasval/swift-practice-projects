//
//  ViewController.swift
//  Tipsy
//
//  Created by Jose Saldana.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet var tipButtons: [UIButton]!
    @IBOutlet weak var stepper: UIStepper!
    
    var tip : Float = 1
    var total : Float = 0.0
    
    override func viewDidLoad() {
        stepper.autorepeat = false
        stepper.minimumValue = 1
        stepper.maximumValue = 80
        stepper.stepValue = 1
        stepper.value = 1
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        for button in tipButtons {
            if button.isSelected == true {
                button.isSelected = false
            }
        }
        sender.isSelected = true
        switch sender {
        case tenPctButton:
            tip = 1.1
        case twentyPctButton:
            tip = 1.2
        default:
            tip = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResultsViewController
        vc.total = total
        vc.split = Int(stepper.value)
        vc.tip = tip
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        
    }
    @IBAction func calculatePressed(_ sender: Any) {
        guard let bill = Float(billTextField.text!) else { print("Bill is not valid"); return }
        total = bill * tip / Float(stepper.value)
        performSegue(withIdentifier: "totalSegue", sender: self)
    }
    
}

