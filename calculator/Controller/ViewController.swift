//
//  ViewController.swift
//  calculator
//
//  Created by David Robert on 16/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var currentNumber = "" // Variável para armazenar o número atual
    var firstOperand: Double = 0 // Variável para armazenar o primeiro operando
    var operation: String = "" // Variável para armazenar a operação selecionada
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        guard let numberText = sender.titleLabel?.text else { return }
        currentNumber += numberText
        displayLabel.text = currentNumber
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        if let number = Double(currentNumber) {
            firstOperand = number
            currentNumber = ""
            if let operationTitle = sender.titleLabel?.text {
                operation = operationTitle
            }
        }
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        if let number = Double(currentNumber) {
            var result: Double = 0
            switch operation {
            case "+":
                result = firstOperand + number
            case "-":
                result = firstOperand - number
            case "×":
                result = firstOperand * number
            case "÷":
                if number != 0 {
                    result = firstOperand / number
                } else {
                    displayLabel.text = "Error"
                    return
                }
            case "%": // Adicionando o caso para porcentagem
                result = firstOperand * number / 100
            default:
                break
            }
            
            // Se o resultado é um número inteiro, exibe como um número inteiro
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                displayLabel.text = "\(Int(result))"
            } else {
                displayLabel.text = "\(result)"
            }
            
            currentNumber = "\(result)"
        }
    }
    
    @IBAction func commaButtonPressed(_ sender: UIButton) {
        // Verifica se o número atual já contém uma vírgula
        if !currentNumber.contains(".") {
            // Se não contém, adiciona a vírgula ao número atual
            currentNumber += "."
            displayLabel.text = currentNumber
        }
    }
        
    @IBAction func clearButtonPressed(_ sender: UIButton) {
            displayLabel.text = "0"
            currentNumber = ""
            firstOperand = 0
            operation = ""
        }
}
