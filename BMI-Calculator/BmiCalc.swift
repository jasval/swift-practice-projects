//
//  BmiCalc.swift
//
//  Created by Jose Saldana on 27/01/2020.
//

import Foundation
import UIKit

struct User {

    var bmi:BMI?
    
    
    func getBmi() -> String {
        let fbmi = String(format: "%.1f", bmi?.value ?? 0.0)
        return fbmi
    }
    
    func getAdvice() -> String {
        let advice = bmi?.advice ?? "No advice"
        return advice
    }
    
    func getColor() -> UIColor {
        let color = bmi?.color ?? UIColor(ciColor: .gray)
        return color
    }

    mutating func calculateBMI(weight: Float, height: Float){
        let bmiValue = weight/(pow(2,height))
        switch bmiValue {
        case 0..<18.5:
            print("You are underweight")
            bmi = BMI(value: bmiValue, advice: "Eat more snacks", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        case 18.5..<25:
            print("Your are in the right weight")
            bmi = BMI(value: bmiValue, advice: "Keep it up!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        case 25...100:
            print("You are overweight")
            bmi = BMI(value: bmiValue, advice: "Ease on the pies", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        default:
            print("Value is not valid")
            bmi = BMI(value: bmiValue, advice: "There was a problem", color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        }
    }
}
