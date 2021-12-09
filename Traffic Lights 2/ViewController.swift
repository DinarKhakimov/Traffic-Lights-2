//
//  ViewController.swift
//  Traffic Lights 2
//
//  Created by Johnny Boshechka on 12/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var startButton: UIButton!
    
   
    
    var currentColor: ColorLight?
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        redLight.layer.cornerRadius = redLight.layer.frame.width / 2
        redLight.alpha = lightIsOff
        
        yellowLight.layer.cornerRadius = yellowLight.layer.frame.width / 2
        yellowLight.alpha = lightIsOff
        
        greenLight.layer.cornerRadius = greenLight.layer.frame.width / 2
        greenLight.alpha = lightIsOff
        
        startButton.layer.cornerRadius = 10
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Georgia", size: 33)
        startButton.setTitle("Start", for: .normal)
        startButton.layer.cornerRadius = startButton.layer.frame.width / 6
    }
    
    @IBAction func startActionButton() {
        
        if startButton.titleLabel?.text == "Start" {
            redLight.alpha = lightIsOn
            startButton.setTitle("Next", for: .normal)
            currentColor = .red
        } else {
            
            switch currentColor {
            case .red:
                redLight.alpha = lightIsOff
                yellowLight.alpha = lightIsOn
                currentColor = .yellow
            case .yellow:
                yellowLight.alpha = 0.3
                greenLight.alpha = 1
                currentColor = .green
            case .green:
                greenLight.alpha = 0.3
                redLight.alpha = 1
                currentColor = .red
            case .none:
                print("Error")
            }
        }
    }
}

extension ViewController {
    
    enum ColorLight {
        case red
        case yellow
        case green
    }
}
