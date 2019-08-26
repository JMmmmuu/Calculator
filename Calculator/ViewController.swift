//
//  ViewController.swift
//  Calculator
//
//  Created by Yuseok on 26/08/2019.
//  Copyright © 2019 Yuseok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewBox: UILabel!
    @IBOutlet weak var clearBtn: UIButton!
    var resultInStr: String = ""
    var isPositive: Bool = true
    var titleOfClearButton: String {
        get {
            if resultInStr.count > 0 {
                return "C"
            } else {
                return "AC"
            }
        }
        set {
            clearBtn.setTitle(newValue, for: .normal)
        }
    }
    
    var previousValue: Double = 0
    var currentValue: Double = 0
    var arithmetic: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewBox.text = "0.0"
    }

    @IBAction func zero(_ sender: UIButton) {
        resultInStr.append("0")
        updateResult()
    }
    @IBAction func one(_ sender: UIButton) {
        resultInStr.append("1")
        updateResult()
    }
    @IBAction func two(_ sender: UIButton) {
        resultInStr.append("2")
        updateResult()
    }
    @IBAction func three(_ sender: UIButton) {
        resultInStr.append("3")
        updateResult()
    }
    @IBAction func four(_ sender: UIButton) {
        resultInStr.append("4")
        updateResult()
    }
    @IBAction func five(_ sender: UIButton) {
        resultInStr.append("5")
        updateResult()
    }
    @IBAction func six(_ sender: UIButton) {
        resultInStr.append("6")
        updateResult()
    }
    @IBAction func seven(_ sender: UIButton) {
        resultInStr.append("7")
        updateResult()
    }
    @IBAction func eight(_ sender: UIButton) {
        resultInStr.append("8")
        updateResult()
    }
    @IBAction func nine(_ sender: UIButton) {
        resultInStr.append("9")
        updateResult()
    }
    @IBAction func pointButton(_ sender: UIButton) {
        if !resultInStr.contains(".") {
            if resultInStr == "" {
                resultInStr.append("0.")
            } else {
                resultInStr.append(".")
            }
        }
        updateResult()
    }
    
    // MARK: - Arithmetic
    @IBAction func plusButton(_ sender: UIButton) {
        previousValue = Double(resultInStr)!
        resetData()
        arithmetic = "plus"
        
    }
    @IBAction func minusButton(_ sender: UIButton) {
        previousValue = Double(resultInStr)!
        resetData()
        arithmetic = "minus"

    }
    @IBAction func multiplyButton(_ sender: UIButton) {
        previousValue = Double(resultInStr)!
        resetData()
        arithmetic = "multiplication"

    }
    @IBAction func divisionButton(_ sender: UIButton) {
        previousValue = Double(resultInStr)!
        resetData()
        arithmetic = "division"

    }
    @IBAction func calculateResult(_ sender: UIButton) {
        if let whichAritmetic = arithmetic {
            currentValue = Double(resultInStr)!
            var result: Double = 0
            switch whichAritmetic {
                case "plus":
                    result = previousValue + currentValue
                
                case "minus":
                    result = previousValue - currentValue
                case "multiplication":
                    result = previousValue * currentValue
                case "division":
                    if currentValue == 0 {
                        print("Error")
                    } else {
                        result = previousValue / currentValue
                    }
                default:
                    print("HOHO")
            }
            if floor(result) == result {
                viewBox.text = String(Int(result))
            } else {
                viewBox.text = String(result)
            }
            resetData()
            previousValue = 0
            currentValue = 0
        }
    }
    
    // MARK: - etc button
    @IBAction func clearButton(_ sender: UIButton) {
        resetData()
        viewBox.text = "0"
        
        titleOfClearButton = "AC"
    }
    @IBAction func toggleSign(_ sender: UIButton) {
        isPositive = !isPositive
        updateResult()
    }
    @IBAction func makePercentage(_ sender: UIButton) {
        if resultInStr != "" {
            if let number = Double(resultInStr) {
                resultInStr = String(number / 100)
            }
        }
        updateResult()
    }
    
    
    
    
    
    
    
    func updateResult() {
        if resultInStr.count > 12 {
            resultInStr = String(resultInStr.dropLast())
        }
        if isPositive {
            if resultInStr.first == "-" {
                resultInStr.remove(at: resultInStr.startIndex)
            }
        } else {
            if resultInStr.first != "-" {
                resultInStr.insert("-", at: resultInStr.startIndex)
            }
        }
        viewBox.text = resultInStr
        
        clearBtn.setTitle(titleOfClearButton, for: .normal)
    }
    
    func resetData() {
        resultInStr = ""
        isPositive = true
    }
}

