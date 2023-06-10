import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var sangwooName: UIButton!
    @IBOutlet weak var sungeunName: UIButton!
    @IBOutlet weak var soyeonName: UIButton!
    @IBOutlet weak var sujiName: UIButton!
    @IBOutlet weak var minseokName: UIButton!
    @IBOutlet weak var sojungName: UIButton!
    
    let speechSynth = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func nameAndNickname(buttonName: UIButton, nickname: String) {
        
        
        let name: String = buttonName.titleLabel?.text ?? ""
        let message: String = "안녕하세요! \(name)님! \(nickname)!"
        helloLabel.text = message
        
        let utterance = AVSpeechUtterance(string: message)
        speechSynth.speak(utterance)
        
    }

    @IBAction func sangwoo(_ sender: Any) {
       nameAndNickname(buttonName: sangwooName, nickname: "상어")
    }
    
    @IBAction func sungeun(_ sender: Any) {
        nameAndNickname(buttonName: sungeunName, nickname: "남성은")
    }
    
    @IBAction func soyeon(_ sender: Any) {
        nameAndNickname(buttonName: soyeonName, nickname: "치코리타")
    }
    
    @IBAction func suji(_ sender: Any) {
        nameAndNickname(buttonName: sujiName, nickname: "장수풍뎅이")
    }
    
    @IBAction func minseok(_ sender: Any) {
        nameAndNickname(buttonName: minseokName, nickname: "민돌")
    }
    
    @IBAction func sojung(_ sender: Any) {
        nameAndNickname(buttonName: sojungName, nickname: "채소")
    }
    
}

