//
//  ViewController.swift
//  HelloUIKit
//
//  Created by 변상우 on 2023/06/09.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var helloLabel: UILabel!
    
    let speechSynth = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sayHello(_ sender: Any) {
        let name: String = nameTextField.text ?? "이름이 없습니다!"
        let message: String = "Hi! \(name)"
        helloLabel.text = "Hi! \(name)"
        
        var utterance = AVSpeechUtterance(string: message)
        speechSynth.speak(utterance)
    }
}
