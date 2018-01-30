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
        digitPress("0")
    }
    
    @IBAction func number1(_ sender: UIButton) {
        digitPress("1")
    }
    
    @IBAction func number2(_ sender: UIButton) {
        digitPress("2")
    }
    
    @IBAction func number3(_ sender: UIButton) {
        digitPress("3")
    }
    
    @IBAction func number4(_ sender: UIButton) {
        digitPress("4")
    }
    
    @IBAction func number5(_ sender: UIButton) {
        digitPress("5")
    }
    
    @IBAction func number6(_ sender: UIButton) {
        digitPress("6")
    }
    
    @IBAction func number7(_ sender: UIButton) {
        digitPress("7")
    }
    
    @IBAction func number8(_ sender: UIButton) {
        digitPress("8")
    }
    
    @IBAction func number9(_ sender: UIButton) {
        digitPress("9")
    }
    
    @IBAction func opAdd(_ sender: UIButton) {
        opPress("+")
    }
    
    @IBAction func opSubtract(_ sender: UIButton) {
        opPress("-")
    }
    
    @IBAction func opMultiply(_ sender: UIButton) {
        opPress("×")
    }
    
    @IBAction func opDivide(_ sender: UIButton) {
        opPress("÷")
    }
    
    @IBAction func opModulus(_ sender: UIButton) {
        opPress("%")
    }
    
    @IBAction func countButton(_ sender: UIButton) {
        opPress("count")
    }
    
    @IBAction func avgButton(_ sender: UIButton) {
        opPress("avg")
    }
    
    @IBAction func factButton(_ sender: UIButton) {
        operation = "fact"
        display.text! += "fact"
        opEquals(sender)
    }
    
    @IBAction func opEquals(_ sender: UIButton) {
        addNum()
        calculate()
        clear(sender)
    }
    
    @IBAction func clear(_ sender: UIButton) {
        display.text = ""
        input.removeAll()
    }


    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var answerBox: UILabel!
    
    private var digits : String = ""    // keeps track of digits that user enters one at a time
    private var input : [Int] = []      // stores the numbers that the user has entered
    private var operation : String = "" // stores the operation that the user has entered
    
    private func digitPress(_ num : String) {
        digits += num
        display.text! += num
    }
    
    private func opPress(_ op : String) {
        addNum()
        operation = op
        display.text! += " " + op + " "
    }
    
    // converts the multiple digits that the user has entered into a single integer
    private func addNum() {
        let num = Int(digits)
        input.append(num!)
        digits = ""
    }
    
    private func calculate() {
        var result : Int
        switch operation {
        case "count":
            result = input.count
        case "avg":
            result = average()
        case "fact":
            result = factorial()
        default:
            let num1 = input[0]
            let num2 = input[1]
            switch operation {
            case "+":
                result = num1 + num2
            case "-":
                result = num1 - num2
            case "÷":
                result = num1 / num2
            case "×":
                result = num1 * num2
            default:    // symbol = "%" case
                result = modulus(num1, num2)
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
        var sum = 0;
        for num in input {
            sum += num
        }
        return Int(sum / input.count)
    }
    
    private func factorial() -> Int {
        let limit = input[0]
        var result = 1
        for num in 1...limit {
            result *= num
        }
        return result
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

