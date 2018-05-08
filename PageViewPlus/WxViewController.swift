//
//  WxViewController.swift
//  PageViewPlus
//
//  Created by macbook on 4/24/18.
//  Copyright © 2018 Jaminya. All rights reserved.
//

import UIKit

class WxViewController: UIViewController {
    
    @IBOutlet weak var cityRegion: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    // Create initial values for Outlets
    var cityState = "Dallas, TX"
    var image = #imageLiteral(resourceName: "PartlySunny")
    var temperature = "80"
    var humidity = "30"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set degree Fahrenheit units
        self.unitLabel.text = "\u{00B0}F"
        
        // Set initial values
        cityRegion.text = cityState
        imageView.image = image
        tempLabel.text = temperature
        humidityLabel.text = humidity
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
