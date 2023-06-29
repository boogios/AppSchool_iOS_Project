//
//  ViewController.swift
//  ClosureCalcUIKit
//
//  Created by 변상우 on 2023/06/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var number1: Int = 0
    var number2: Int = 0
    
    var oprFunc: (Int, Int) -> Int = { (n1: Int, n2: Int) -> Int in
        return n1 + n2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pressButton10(_ sender: UIButton) {
        number1 = 10
    }
    
    @IBAction func pressButton20(_ sender: UIButton) {
        number1 = 20
    }
    
    @IBAction func pressButton30(_ sender: UIButton) {
        number1 = 30
    }
    
    @IBAction func pressButtonMultiply(_ sender: UIButton) {
        oprFunc = { (n1: Int, n2: Int) -> Int in
            return n1 * n2
        }
    }
    
    @IBAction func pressButtonDivide(_ sender: UIButton) {
        oprFunc = { (n1: Int, n2: Int) -> Int in
            return n1 / n2
        }
    }
    
    @IBAction func pressButtonPlus(_ sender: UIButton) {
        oprFunc = { (n1: Int, n2: Int) -> Int in
            return n1 + n2
        }
    }
    
    @IBAction func pressButton3(_ sender: UIButton) {
        number2 = 3
    }
    
    @IBAction func pressButton6(_ sender: UIButton) {
        number2 = 6
    }
    
    @IBAction func pressButton9(_ sender: UIButton) {
        number2 = 9
    }
    
    @IBAction func pressButtonCalc(_ sender: UIButton) {
        
        let result: Int = oprFunc(number1, number2)
        
        resultLabel.text = "\(result)"
    
    }
    
    
}

