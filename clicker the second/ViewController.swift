//
//  ViewController.swift
//  clicker the second
//
//  Created by Conqueriings on 29/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rickIm: UIImageView!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var congrats: UILabel!
    var counter = 0
    var timer: Timer?
    var timeElapsed = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 10;
        clear.layer.cornerRadius = 10;
        // bools
        congrats.isHidden = true
        time.isHidden = true
        rickIm.isHidden = true
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        timeElapsed += 0.1
    }

    @IBAction func clickButton(_ sender: Any) {
        self.counterLabel.alpha = 1
        UIView.animate(withDuration: 1) {
        self.counterLabel.alpha = 0
            self.counterLabel.alpha = 1
    }
        counter += 1
        time.isHidden = false
        // speed = clicks per second
        time.text = "Speed: \(timeElapsed) c/s"
        
        if counter > 20 {
            congrats.isHidden = false
            congrats.text = "Keep going!"
        }
        counterLabel.text = "You pressed \(counter) times!"
        if counter == 100 {
            rickIm.isHidden = false
            counterLabel.isHidden = true
            congrats.text = "100th click!!!"
        }
        if counter == 69 {
            congrats.text = "ayo thats sus 🌚"
        }
        if counter > 100 {
            counterLabel.isHidden = false
            rickIm.isHidden = true
        }
        if counter >= 150 {
            button.isEnabled = false
            button.setTitle("Finished", for: .disabled)
            congrats.text = "Its time to take a rest"
        }
    }
    @IBAction func clearButton(_ sender: Any) {
            congrats.isHidden = true
            counter = 0
            counterLabel.text = "\(counter)"
        }
    @IBAction func randomPicker(_ sender: Any) {
        self.counterLabel.alpha = 1
        congrats.isHidden = true
        time.isHidden = true
        func random(_ n:Int) -> Int {
            return Int(arc4random_uniform(UInt32(n)))
        }
        for _ in 0...100 {
            counterLabel.text = "\(random(100))"
    }
}

}
