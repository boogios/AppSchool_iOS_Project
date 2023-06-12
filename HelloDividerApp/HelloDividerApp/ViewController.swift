import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number1TextField: UITextField!
    @IBOutlet weak var number2TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func divideButton(_ sender: Any) {
        
        let number1: Double = Double(number1TextField.text ?? "") ?? 0.0
        let number2: Double = Double(number2TextField.text ?? "") ?? 0.0
        
        // guard else 구문
        guard number2 != 0.0 else {
            resultLabel.text = "Can't divide by zero."
            return
        }
        
        // if let 구문
//        if number2 == 0.0 {
//            resultLabel.text = "Can't divide by zero."
//        } else {
//            let result: Double = number1 / number2
//            resultLabel.text = "\(number1) / \(number2) = \(result)"
//        }
        
        let result: Double = number1 / number2
        resultLabel.text = "\(number1) / \(number2) = \(result)"
    }
}

