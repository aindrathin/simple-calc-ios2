//
//  ViewController.swift
//  simple-calc-iOS
//
//  Created by Aindra Thin on 1/29/18.
//  Copyright © 2018 Aindra Thin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func number0(_ sender: UIButton) {
        input.append("0")
        update()
    }
    
    @IBAction func number1(_ sender: UIButton) {
        update()
        input.append("1")
        update()
    }
    
    @IBAction func number2(_ sender: UIButton) {
        input.append("2")
        update()
    }
    
    @IBAction func number3(_ sender: UIButton) {
        input.append("3")
        update()
    }
    
    @IBAction func number4(_ sender: UIButton) {
        input.append("4")
        update()
    }
    
    @IBAction func number5(_ sender: UIButton) {
        input.append("5")
        update()
    }
    
    @IBAction func number6(_ sender: UIButton) {
        input.append("6")
        update()
    }
    
    @IBAction func number7(_ sender: UIButton) {
        input.append("7")
        update()
    }
    
    @IBAction func number8(_ sender: UIButton) {
        input.append("8")
        update()
    }
    
    @IBAction func number9(_ sender: UIButton) {
        input.append("9")
        update()
    }
    
    @IBAction func opAdd(_ sender: UIButton) {
        input.append("+")
        update()
    }
    
    @IBAction func opSubtract(_ sender: UIButton) {
        input.append("-")
        update()
    }
    
    @IBAction func opMultiply(_ sender: UIButton) {
        input.append("×")
        update()
    }
    
    @IBAction func opDivide(_ sender: UIButton) {
        input.append("÷")
        update()
    }
    
    @IBAction func opModulus(_ sender: UIButton) {
        input.append("%")
        update()
    }
    
    @IBAction func opEquals(_ sender: UIButton) {
        calculate()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        input.removeAll()
        update()
    }

    @IBAction func countButton(_ sender: UIButton) {
        input.append("count")
        clear(sender)
    }
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var answerBox: UILabel!
    
    private var input : [String] = []
    private var operation : String = ""
    
    private func update() {
        var result = ""
        for element in input {
            result += element + " "
        }
        display.text = input.description
    }

    private func calculate() {
        let last = input[input.count - 1]
        var result : Int
        switch last {
        case "count":
            result = input.count - 1
        case "avg":
            result = average()
        case "fact":
            result = factorial()
        default:
            let num1 = Int(input[0])
            let num2 = Int(input[2])
            let symbol = input[1]
            switch symbol {
            case "+":
                result = num1! + num2!
            case "-":
                result = num1! - num2!
            case "÷":
                result = num1! / num2!
            case "×":
                result = num1! * num2!
            default:    // symbol = "%" case
                result = modulus(num1!, num2!)
            }
        }
        answerBox.text = String(result)
    }
    
    private func modulus(_ num1: Int, _ num2: Int) -> Int {
        var remainder = num1
        let divisor = num2
        while remainder >= divisor {
            remainder -= divisor
        }
        return remainder
    }
    
    private func average() -> Int {
        return 1
    }
    
    private func factorial() -> Int {
        return 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

