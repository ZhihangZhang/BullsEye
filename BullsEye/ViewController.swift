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
        startOver()
        
        //customize the apperance of the slider
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Actions
    @IBAction func showAlert(){
        // local variables
        let bonus = 100
        
        // update points and round
        let diff = abs(currentSliderValue - targetValue)
        var gain = calculatePoints(inputValue: currentSliderValue, targetValue: targetValue)
        points += gain
        //bonus if perfect case
        if diff == 0 {
            points += bonus
            gain += bonus
        }
        
        // configure alert and action
        let alertMessage = "You gained \(gain) this round.\n"
            + "You have \(points) points in total!"
        let alertTitle = calculateTitleForAlert(difference: diff)
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue", style: .default, handler: {action in self.startNewRound()})
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        // a new round as the callback function is executed when the action button is pressed
    }
    
    //gets called when the slider moves
    @IBAction func sliderMoved(_ slider: UISlider){
        currentSliderValue = lroundf(slider.value)
    }


    
    @IBAction func startOver(){
        points = 0
        round = 0
        startNewRound()
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
    
    func calculateTitleForAlert(difference: Int) -> String{
        if difference == 0 {
            return "Perfect!"
        } else if difference < 5 {
            return "Almost There!"
        } else if difference < 10 {
            return "Not bad!"
        } else {
            return "Not even close :("
        }
    }
}

