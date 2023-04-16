//
//  ViewController.swift
//  TempConverter
//
//  Created by patricija.vainovska on 16/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tempSlider: UISlider!{
        didSet{
            tempSlider.maximumValue = 100
            tempSlider.minimumValue = 0
            tempSlider.value = 0
        }
    }
    @IBOutlet weak var segmentSwitch: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabelValues()
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        updateLabelValues()
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        updateLabelValues()
    }
    
    func updateLabelValues() {
        let celsiusTemp = Int(tempSlider.value)
        celsiusLabel.text = "\(celsiusTemp) Cº"
        
        let conversionChart = convertTempFrom(celsius: celsiusTemp)
        
        if segmentSwitch.selectedSegmentIndex == 0 {
            resultLabel.text = "\(conversionChart.fahrenheit) Fº"
        } else {
            resultLabel.text = "\(conversionChart.kelvin) Kº"
        }
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Int, kelvin: Int) {
        let temparatureInDegreesFahrenheit = Int(1.8 * Double(celsius) + 32)
        let temperatureInKelvins = celsius + 273
        return (temparatureInDegreesFahrenheit, temperatureInKelvins)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoSegue" {
            let infoViewController = segue.destination as! InfoViewController
            infoViewController.studentName = "Patricija Vainovska"
            infoViewController.appInfo = "This is an app for converting degrees from celsius, which we primarily use, to fahrenheit and kelvin, which are more used in America and science community respectively. To make it more interesting it also does cool stuff when changing mode to dark and back!"
        }
    }
}

