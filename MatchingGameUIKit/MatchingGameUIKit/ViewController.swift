//
//  ViewController.swift
//  MatchingGameUIKit
//
//  Created by 변상우 on 2023/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var problemImageView: UIImageView!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    @IBOutlet weak var questionNumber1: UIButton!
    @IBOutlet weak var questionNumber2: UIButton!
    @IBOutlet weak var questionNumber3: UIButton!
    @IBOutlet weak var questionNumber4: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    // 임의로 문제를 담은 구조체 배열
    var imageBundle: [Problem] = [
        Problem(image: "avengers", answer: 7),
        Problem(image: "family", answer: 40),
        Problem(image: "ghost", answer: 20),
        Problem(image: "cat", answer: 0),
        Problem(image: "students", answer: 3),
        Problem(image: "baby", answer: 1),
    ]
    
    // 맞은 문제 개수, 틀린 문제 개수, 문제의 보기를 담을 배열
    var correctCount: Int = 0
    var wrongCount: Int = 0
    var questionArray: [Int] = [0, 0, 0, 0]
    
    // 현재 문제의 Index값, 현재 게임 중인지 끝났는지를 알려주기 위한 현재 상태 값 변수
    var currentProblemIndex: Int = 0
    var currentStatus = GameStatus.start
    
    // 버튼 비활성화를 위한 상태 변수
    var startButtonDisabled = false // Start 버튼
    var questionButtonDisabled = true // 문제 버튼
    
    // 총 문제의 개수 = 임의로 설정한 배열의 크기
    var totalProblemCount: Int {
        return imageBundle.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기 설정: 보기 버튼 비활성화
        questionBtnisEnabled(false)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // 버튼안에 있는 텍스트 값 Optional 처리
        if var title = sender.titleLabel?.text {
            // "1명" 에서 가장 마지막 글자 제거
            title = String(title.dropLast())
            // String 값인 1을 Int로 바꾸고 Optional 처리
            if let selectedNumber = Int(title) {
                // 고른 답이 정답인지 체크해주는 함수
                isCorrect(selectedNumber)
            }
        }
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        
        switch currentStatus {
        // MARK: - 시작 버튼 클릭
        case .start:
            titleLabel.text = "몇명일까요~?"
            problemImageView.image = UIImage(named: "\(imageBundle[currentProblemIndex].image)")
            
            // 시작하기 누르면 첫번째 문제 생성
            questionGenerator(problem: imageBundle[currentProblemIndex])
            
            // 게임 상태를 게임 중으로 변경
            currentStatus = GameStatus.goingOn
            
            // 보기 버튼들 활성화
            questionBtnisEnabled(true)
            
            // 재시작 버튼으로 텍스트 변경
            startButton.setTitle("ReStart", for: .normal)
            
            // 시작 버튼 비활성화
            startButton.isEnabled = false
            
        // MARK: - 재시작 버튼 클릭
        case .goingOn ,.end:
            // 재시작을 누르면 초기 화면으로 돌아감
            titleLabel.text = "Game of Counting People"
            problemImageView.image = UIImage(named: "game")
            // 시작 버튼으로 변경
            startButton.setTitle("Start", for: .normal)
            // 게임 상태를 start로 변경
            currentStatus = GameStatus.start
            
            // 보기 버튼들 모두 0으로 변경
            questionNumber1.setTitle("\(questionArray[0])명", for: .normal)
            questionNumber2.setTitle("\(questionArray[1])명", for: .normal)
            questionNumber3.setTitle("\(questionArray[2])명", for: .normal)
            questionNumber4.setTitle("\(questionArray[3])명", for: .normal)
            
            // 정답 수, 오답 수 모두 0으로 변경
            correctLabel.text = "오답 수: \(correctCount)개"
            wrongLabel.text = "오답 수: \(wrongCount)개"
            
        }
    }
    
    // 문제와 답을 순서에 맞게 생성하는 함수
    func questionGenerator(problem: Problem) {
            
        // 문제 보기들을 랜덤으로 생성
        let randomAnswerIndex = Int.random(in: 0...3)
        
        // 문제 보기들을 랜덤으로 생성하여 담을 배열
        var tempQuestionArray: [Int] = [0,0,0,0]

        // 진짜 답
        let realAnswer = problem.answer
        
        switch realAnswer {
        // 진짜 답이 0명 ~ 2명인 경우 보기에 마이너스 값이 들어가지 않도록 [0,1,2,3] 로 설정
        case 0...2 :
            tempQuestionArray = [0,1,2,3]
        default :
            for index in 0...3 {
                tempQuestionArray[index] = problem.answer + (index - randomAnswerIndex)
            }
            // 랜덤으로 생성한 보기 배열에 진짜 답을 넣어주기
            tempQuestionArray[randomAnswerIndex] = realAnswer
        }
        
        // 현재 문제의 순서에 맞게 이미지 변경
        problemImageView.image = UIImage(named: "\(imageBundle[currentProblemIndex].image)")
        
        // 랜덤으로 보기를 생성 후
        questionArray = tempQuestionArray
        
        // 버튼 각각의 텍스트를 변경
        questionNumber1.setTitle("\(questionArray[0])명", for: .normal)
        questionNumber2.setTitle("\(questionArray[1])명", for: .normal)
        questionNumber3.setTitle("\(questionArray[2])명", for: .normal)
        questionNumber4.setTitle("\(questionArray[3])명", for: .normal)
        
        
    }
    
    // 누른 답이 정답인지 아닌지 체크하는 함수
    func isCorrect(_ selectedNumber: Int) {
        
        // 정답인 경우
        if selectedNumber == imageBundle[currentProblemIndex].answer {
            correctCount += 1
            correctLabel.text = "정답 수: \(correctCount)개"
        } else { // 오답일 경우
            wrongCount += 1
            wrongLabel.text = "오답 수: \(wrongCount)개"
        }
        
        // 마지막 문제일 경우 더이상 currentProblemIndex += 1 하지 않고 그대로 종료
        // 초기 화면으로 돌아감
        guard currentProblemIndex != imageBundle.count - 1 else {
            
            // 보기 버튼들 비활성화
            questionBtnisEnabled(false)
            
            // 재시작 버튼 활성화
            startButton.isEnabled = true
            
            // 게임 상태도 end로 변경
            currentStatus = GameStatus.end
            
            currentProblemIndex = 0
            correctCount = 0
            wrongCount = 0
            
            questionArray = [0, 0, 0, 0]
            
            return
        }
        
        currentProblemIndex += 1
        questionGenerator(problem: imageBundle[currentProblemIndex])
        
    }
    
    // 보기 버튼들 활성화, 비활성화 함수
    func questionBtnisEnabled(_ status: Bool) {
        questionNumber1.isEnabled = status
        questionNumber2.isEnabled = status
        questionNumber3.isEnabled = status
        questionNumber4.isEnabled = status
    }

}

struct Problem {
    let image: String
    let answer: Int
}

enum GameStatus {
    case start
    case goingOn
    case end
}
