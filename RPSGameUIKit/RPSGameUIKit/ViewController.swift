//
//  ViewController.swift
//  RPSGameUIKit
//
//  Created by 변상우 on 2023/06/26.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var vsImage: UIImageView!
    @IBOutlet weak var vsImage1: UIImageView!
    
    @IBOutlet weak var comImage: UIImageView!
    @IBOutlet weak var personImage: UIImageView!
    
    let rpsArray = ["가위", "바위", "보"]
    let comImageArray = ["com_scissors", "com_rock", "com_paper"]
    let personImageArray = ["scissors", "rock", "paper"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vsImage.image = UIImage(named: "vs")
        vsImage1.image = UIImage(named: "vs")
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        var computerChoice: Int = Int.random(in: 0...2)
        let selected = sender.titleLabel?.text
        
        comImage.image = UIImage(named: comImageArray[computerChoice])
        personImage.image = UIImage(named: personImageArray[sender.tag])

        guard selected != rpsArray[computerChoice] else {
            resultLabel.text = "무승부입니다!"
            return
        }
        
        // 컴퓨터: 가위
        if computerChoice == 0 {
            if selected == "바위" {
                resultLabel.text = "이겼습니다"
            } else {
                resultLabel.text = "졌습니다ㅠ"
            }
        }
        
        // 컴퓨터: 바위
        if computerChoice == 1 {
            if selected == "보" {
                resultLabel.text = "이겼습니다"
            } else {
                resultLabel.text = "졌습니다ㅠ"
            }
        }
        
        // 컴퓨터: 보
        if computerChoice == 2 {
            if selected == "가위" {
                resultLabel.text = "이겼습니다"
            } else {
                resultLabel.text = "졌습니다ㅠ"
            }
        }
        
    }
    

}

