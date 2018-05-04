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
    
    //MARK: Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    
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
        let alertMessage = "The value of slider is \(currentSliderValue)" + "\nThe target value is \(targetValue)\n"
        let alert = UIAlertController(title: "Result", message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
        updateLabels()
    }
    
    func updateLabels(){
        targetValueLabel.text = String(targetValue)
    }
}

