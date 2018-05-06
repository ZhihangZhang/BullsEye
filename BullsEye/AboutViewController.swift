//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Zhihang Zhang on 2018-05-05.
//  Copyright © 2018 Zhihang Zhang. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){           // finding the path to the .html file in the current bundle
            if let htmlData = try? Data(contentsOf: url){                                       // try to construct a data buffer for the file
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)                      // create base url
                
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL) // load the html file into the web view
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
