import UIKit

//let students: [String] = ["KeeN","SW","iOS", "PUJIN"]

class ViewController: UIViewController {

    @IBOutlet weak var studentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var studentsText: String = ""
        
        for student in students {
            studentsText = studentsText + "\(student)\n"
        }
        
        studentLabel.text = "\(studentsText)"
    }
}

