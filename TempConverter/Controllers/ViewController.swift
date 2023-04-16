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
        var value = tempSlider.value
        
        let celsiusTemp = Int(value)
        celsiusLabel.text = "\(celsiusTemp) Cº"
        
        let conversionChart = convertTempFrom(celsius: celsiusTemp)
        
        let segmentSwitchIndex = segmentSwitch.selectedSegmentIndex
        if segmentSwitchIndex == 0 {
            resultLabel.text = "\(conversionChart.fahrenheit) Fº"
        } else {
            resultLabel.text = "\(conversionChart.kelvin) Kº"
        }
        
        // TODO: Dark light mode again. corner radius, create same info darklight mode
        // make both of them like modals (like settings), but the same logic
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Int, kelvin: Int) {
        let temparatureInDegreesFahrenheit = Int(1.8 * Double(celsius) + 32)
        let temperatureInKelvins = celsius + 273
        return (temparatureInDegreesFahrenheit, temperatureInKelvins)
    }
}

