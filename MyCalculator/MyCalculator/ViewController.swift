//
//  ViewController.swift
//  MyCalculator
//
//  Created by 변상우 on 2023/06/28.
//

import UIKit

class ViewController: UIViewController {
    
    var result: Double = 0
    var number1: Double = 0
    var number2: Double = -1
    var opr: String = ""
    
    var editableNewNumber = false
    
    var oprFunc: (Double, String, Double) -> Double = { (n1: Double, opr: String, n2: Double) -> Double in
        switch opr {
        case "+":
            return n1 + n2
        case "-":
            return n1 - n2
        case "X":
            return n1 * n2
        case "/":
            return n1 / n2
        default:
            return n1 + n2
        }
    }

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    // AC 버튼 초기화 버튼 클릭 시
    @IBAction func pressResetButton(_ sender: UIButton) {
        resultLabel.text = "0"
        number1 = 0
        number2 = -1
        result = 0
        editableNewNumber = false // 초기값으로 모두 설정
    }
    
    // 나누기, 곱하기, 빼기, 더하기 버튼 클릭 시
    @IBAction func pressOprButton(_ sender: UIButton) {
        guard let number = resultLabel.text else { return }
        number2 = Double(number) ?? 0.0
        
        guard let selectedOperator = sender.titleLabel?.text else { return }
        opr = selectedOperator
        
        guard number1 != 0 else {
            resultLabel.text = String(number2)
            number1 = number2 // 앞의 숫자에 현재까지의 값 저장
            number2 = 0
            editableNewNumber = true
            return
        }
        
        result = oprFunc(number1, opr, number2)
        print("\(number1) | \(number2) | \(result)")
        
        number1 = result // 앞의 숫자에 현재까지의 값 저장
        number2 = 0
        
        resultLabel.text = String(result)
        editableNewNumber = true // 새로운 숫자 입력할 수 있도록 상태값 true로 변경
        
    }
    
    @IBAction func pressNumberButton(_ sender: UIButton) {
        
        guard var inputNumber = sender.titleLabel?.text else { return }

        guard let currentNumber = resultLabel.text else { return }
        
        // 가장 처음값이 0일때 0 제거
        guard resultLabel.text != "0" else {
            resultLabel.text = inputNumber
            return
        }
        
        guard !editableNewNumber else {
            resultLabel.text = inputNumber
            editableNewNumber.toggle() // 다시 비활성화
            return
        }
        
        inputNumber = currentNumber + inputNumber
        resultLabel.text = inputNumber
        
    }
    
    @IBAction func pressResultButton(_ sender: UIButton) {
        guard let number = resultLabel.text else { return }
        number2 = Double(number) ?? 0.0
        
        result = oprFunc(number1, opr, number2)
        print("\(number1) | \(number2) | \(result)")
        
        number1 = 0 // 앞의 숫자에 현재까지의 값 저장
        number2 = 0
    
        resultLabel.text = String(result)
        editableNewNumber = false // 새로운 숫자 입력할 수 있도록 상태값 false로 변경
    }
    
    
}

