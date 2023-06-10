import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "\(number)"
    }
    
    
    @IBAction func downButton(_ sender: Any) {
        number -= 1
        countLabel.text = "\(number)"
        print("DOWN!")
    }
    
    @IBAction func upButton(_ sender: Any) {
        number += 1
        countLabel.text = "\(number)"
        print("UP!")
    }
    
    @IBAction func clearButton(_ sender: Any) {
        number = 0
        countLabel.text = "\(number)"
    }
}

