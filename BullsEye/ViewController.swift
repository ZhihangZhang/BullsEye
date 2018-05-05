//
//  ViewController.swift
//  BullsEye
//
//  Created by Zhihang Zhang on 2018-05-03.
//  Copyright © 2018 Zhihang Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Propertie
    var currentSliderValue: Int = 0
    var targetValue: Int = 0
    var points: Int = 0
    var round: Int = 0
    
    
    //MARK: Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSliderValue = lroundf(slider.value) // it is redundant if you decided to reset the value in the startNewRound method
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Actions
    @IBAction func showAlert(){
        
        // update points and round
        let gain = calculatePoints(inputValue: currentSliderValue, targetValue: targetValue)
        points += gain
        
        // configure alert and action

        let alertMessage = "You gained \(gain) this round.\n"
            + "You have \(points) points in total!"
        
        
        let alert = UIAlertController(title: "Yo!", message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        // start a new round
        startNewRound()
    }
    
    //gets called when the slider moves
    @IBAction func sliderMoved(_ slider: UISlider){
        currentSliderValue = lroundf(slider.value)
    }


    
    //MARK: functions
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        // reset the slider position and value if you want, but i prefer not to reset it

        round+=1
        updateTargetLabel()
    }
    
    func updateTargetLabel(){
        targetValueLabel.text = String(targetValue)
        scoreLabel.text = String(points)
        roundLabel.text = String(round)
    }
    
    func calculatePoints(inputValue: Int, targetValue: Int) -> Int{
        return 100 - abs(inputValue - targetValue)
    }
}

