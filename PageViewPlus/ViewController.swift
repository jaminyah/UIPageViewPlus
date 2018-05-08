//
//  ViewController.swift
//  PageViewPlus
//
//  Created by macbook on 4/24/18.
//  Copyright © 2018 Jaminya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherField: UITextField!
    @IBOutlet weak var tempLabel: UITextField!
    @IBOutlet weak var humidityLabel: UITextField!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    var forecast: Forecast?
    var viewModel: ViewModel!
    var wxViewController = WxViewController()
    
    let wxViewNotification = Notification.Name("wxViewNotification")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set degree Fahrenheit units
        self.degreeLabel.text = "\u{00B0}F"
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addUIView(_ sender: Any) {
        print("Adding UIView")
        
        // Instantiate viewcontroller for pageviewcontroller datasource
        //let wxViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "wxViewController") as? WxViewController
        
        guard let skyCondition = weatherField.text, skyCondition != "" else {
            // Set frame to red
            let redBorder = UIColor.red
            //weatherField.layer.borderColor = UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
            weatherField.layer.borderColor = redBorder.cgColor
            weatherField.layer.borderWidth = 1.0
            print("SkyCondition is empty")
            return
        }
        
        guard let aTemp = tempLabel.text, aTemp != "" else {
            tempLabel.layer.borderColor = UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
            tempLabel.layer.borderWidth = 1.0
            print("Temperature is empty")
            return
        }
        
        guard let aHumidity = humidityLabel.text, aHumidity != "" else {
            humidityLabel.layer.borderColor = UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
            humidityLabel.layer.borderWidth = 1.0
            print("Humidity is empty")
            return
        }
        
        guard let aCity = cityTextField.text, aCity != "" else {
            cityTextField.layer.borderColor = UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
            cityTextField.layer.borderWidth = 1.0
            print("City field is empty")
            return
        }
        
        guard let aState = stateTextField.text, aState != "" else {
            stateTextField.layer.borderColor = UIColor(red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
            stateTextField.layer.borderWidth = 1.0
            print("State field is empty")
            return
        }
        
        forecast = Forecast(sky: skyCondition, temperature: aTemp, humidity: aHumidity, city: aCity, state: aState)
        
        // Push pageviewcontroller via segue
        performSegue(withIdentifier: "pageViewSegue", sender: self)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let forecast = forecast else {
            return
        }
        let viewController = WxViewModel(forecast: forecast).createViewController() //else {
           // return
        //}
        
        if let destinationVC = segue.destination as? PageViewController {
            destinationVC.pages.append(viewController!)
        //destinationVC.wxData = forecast
        }
    }
}
