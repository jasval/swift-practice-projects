//
//  ViewController.swift
//
//  Created by Jose Saldana.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!

    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer?
    


    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
        secondsPassed = 0
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer( timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            print("\(totalTime - secondsPassed) seconds.")
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
}
