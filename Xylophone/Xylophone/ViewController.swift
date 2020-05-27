//
//  ViewController.swift
//  Xylophone
//
//  Created by Jose Saldana.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let keySound:String? = sender.currentTitle
        playSound(source: keySound)
        dimButton(source: sender)
    }
    func dimButton(source: UIButton){
        source.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            source.alpha = 1
        }
    }
    func playSound(source:String?) {
        let url = Bundle.main.url(forResource: source, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
