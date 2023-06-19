//
//  ViewController.swift
//  RandomNumberUIKit
//
//  Created by 변상우 on 2023/06/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultString: UILabel!
    
    var randomNumber = Int.random(in: 0...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func zeroBtnPressed(_ sender: UIButton) {
        
        let number = sender.titleLabel?.text ?? ""
        isCorrect(number)
    }
    
    @IBAction func newGameBtnPressed(_ sender: UIButton) {
        randomNumber = Int.random(in: 0...10)
        resultString.text = "랜덤 숫자를 맞춰보세요!"
    }
    
    func isCorrect(_ selectedNumber: String?) {
        if let num = Int(selectedNumber ?? "0") {
            if num < randomNumber {
                resultString.text = "정답보다 작습니다!"
            } else if num > randomNumber {
                resultString.text = "정답보다 큽니다!"
            } else {
                resultString.text = "정답입니다!"
            }
        }
        
//        if selectedNumber == String(randomNumber) {
//            resultString.text = "정답입니다!"
//        } else if Int(selectedNumber) ?? 0 < randomNumber {
//
//        }
//        else {
//            resultString.text = "틀렸습니다ㅠ"
//        }
    }
}
