//
//  ViewController.swift
//  19SeptemberBootcampAssigment
//
//  Created by Anıl Sezer on 23.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonClearTapped(_ sender: Any) {
        textField.text = ""
    }
    
    @IBAction func buttonPlusTapped(_ sender: Any) {
        if !textField.text!.isEmpty && textField.text?.last != "+" {
            textField.text = textField.text! + "+"
        } else {
        }
    }
    
    @IBAction func showResultButton(_ sender: Any) {
        
        if let inputText = textField.text {
            
            let numbers = inputText.split(separator: "+")
            
            var result = 0
            for numberStr in numbers {
                if let number = Int(numberStr) {
                    result += number
                }
            }
            textField.text = String(result)
        }
    }
    @IBAction func buttonDeleteTapped(_ sender: Any) {
        if !textField.text!.isEmpty {
            textField.text?.removeLast()
        } else {
            
        }
    }
    
    @IBAction func button0(_ sender: Any) {
        
        textField.text = textField.text! + "0"
    }
    
    @IBAction func button1(_ sender: Any) {
        textField.text = textField.text! + "1"
    }
    
    @IBAction func button2(_ sender: Any) {
        textField.text = textField.text! + "2"
    }
    
    @IBAction func button3(_ sender: Any) {
        textField.text = textField.text! + "3"
    }
    
    @IBAction func button4(_ sender: Any) {
        textField.text = textField.text! + "4"
    }
    
    @IBAction func button5(_ sender: Any) {
        textField.text = textField.text! + "5"
    }
    
    @IBAction func button6(_ sender: Any) {
        textField.text = textField.text! + "6"
    }
    
    @IBAction func button7(_ sender: Any) {
        textField.text = textField.text! + "7"
    }
    
    @IBAction func button8(_ sender: Any) {
        textField.text = textField.text! + "8"
    }
    
    @IBAction func button9(_ sender: Any) {
        textField.text = textField.text! + "9"
    }
}

