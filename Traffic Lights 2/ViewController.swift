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
    
    
    
    private var currentColor: ColorLight = .red
    private let lightIsOn: CGFloat = 1.0
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        startButton.layer.cornerRadius = 10
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        print("\(startButton.frame.height) and \(startButton.frame.height)")
        print("\(redLight.frame.height) and \(redLight.frame.height)")
        
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
        
        startButton.titleLabel?.font = UIFont(name: "Georgia", size: 33)
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitle("Start", for: .normal)
        
        print("View Will Layout Subviews \(startButton.frame.height) and \(startButton.frame.height)")
        print("View Will Layout Subviews \(redLight.frame.height) and \(redLight.frame.height)")
    }
    
    @IBAction func startActionButton() {
        
        if startButton.titleLabel?.text == "Start" {
            startButton.setTitle("Next", for: .normal)
        }
        
        switch currentColor {
        case .red:
            redLight.alpha = lightIsOn
            greenLight.alpha = lightIsOff
            currentColor = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentColor = .green
        case .green:
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOff
            currentColor = .red
            
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
