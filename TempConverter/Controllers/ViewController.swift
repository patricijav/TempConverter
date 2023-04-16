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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "32 Fº"
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        // print("tempSlider:", tempSlider.value)
        updateResultLabelValue(value: tempSlider.value)
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        updateResultLabelValue(value: tempSlider.value)
    }
    
    func updateResultLabelValue(value: Float) {
        print(value)
        
        let celsiusTemp = Int(value)
        resultLabel.text = "\(celsiusTemp) Cº" // Update celsisu label instead
        
        var convertedTempString = ""
        // TODO: Use switch case, run convertTempFrom()
        // switch case, convertedTempString = converTempFromcelsius:celsisusTemp
        
        /// TODO: Dark light mode again. corner radius, create same info darklight mode
        /// make both of them like modals (like settings), but the same logic
        /// constraints
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
        // TODO: Implement calculation logic
        return (0,0)
    }
}

