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
    var currentSliderValue: Int = 50 // zero is a stub value, which is not valid for the slider

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Actions
    @IBAction func showAlert(){
        let alertMessage = "The value of slider is \(currentSliderValue)"
        let alert = UIAlertController(title: "Hi", message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Oh ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentSliderValue = lroundf(slider.value)
    }


}

