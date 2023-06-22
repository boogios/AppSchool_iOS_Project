//
//  ContentView.swift
//  MatchingGameSwiftUI
//
//  Created by 변상우 on 2023/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var correctCount: Int = 0
    @State var wrongCount: Int = 0
    @State var questionArray: [Int] = [0, 0, 0, 0]
    
    var solvedProblemNumber: Int {
        return correctCount + wrongCount
    }
    
    @State var currentProblemIndex: Int = 0
    @State var currentStatus = GameStatus.start
    @State var startButtonDisabled = true
    @State var questionButtonDisabled = true
    
    var totalProblemCount: Int {
        return imageBundle.count
    }
    
    enum GameStatus {
        case start
        case goingOn
        case end
    }
    
    var imageBundle: [Problem] = [
        Problem(image: "avengers", answer: 7),
        Problem(image: "family", answer: 40),
        Problem(image: "ghost", answer: 20),
        Problem(image: "cat", answer: 0),
        Problem(image: "students", answer: 3),
        Problem(image: "baby", answer: 1),
    ]
    
    struct Problem {
        let image: String
        let answer: Int
    }
    
    var body: some View {
        VStack {
            Spacer()
            switch currentStatus {
            case .goingOn:
                Text("몇명일까요~?")
                    .font(.largeTitle)
                Image("\(imageBundle[currentProblemIndex].image)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Spacer()
                HStack {
                    Group {
                        Button {
                            buttonPressed(questionArray[0])
                        } label: {
                            Text("\(questionArray[0])명")
                        }
                        Button {
                            buttonPressed(questionArray[1])
                        } label: {
                            Text("\(questionArray[1])명")
                        }
                        Button {
                            buttonPressed(questionArray[2])
                        } label: {
                            Text("\(questionArray[2])명")
                        }
                        Button {
                            buttonPressed(questionArray[3])
                        } label: {
                            Text("\(questionArray[3])명")
                        }
                    }
                }
            case .start, .end:
                Text("Game of Counting People")
                    .font(.system(size: 30))
                    .bold()
                Image("game")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Spacer()
                HStack {
                    Button {
                        buttonPressed(questionArray[0])
                    } label: {
                        Text("\(questionArray[0])명")
                    }
                    Button {
                        buttonPressed(questionArray[1])
                    } label: {
                        Text("\(questionArray[1])명")
                    }
                    Button {
                        buttonPressed(questionArray[2])
                    } label: {
                        Text("\(questionArray[2])명")
                    }
                    Button {
                        buttonPressed(questionArray[3])
                    } label: {
                        Text("\(questionArray[3])명")
                    }
                }
                .disabled(questionButtonDisabled)
            }
            Spacer()
            Text("정답 수: \(correctCount)개\n오답 수: \(wrongCount)개")
                .font(.largeTitle)
            Spacer()
            switch currentStatus {
            case .start:
                Button {
                    questionGenerator(problem: imageBundle[currentProblemIndex])
                    currentStatus = GameStatus.goingOn
                } label: {
                    Text("Start")
                }
                
            case .goingOn, .end:
                Button {
                    questionGenerator(problem: imageBundle[currentProblemIndex])
                    currentStatus = GameStatus.start
                    startButtonDisabled = true
                    
                    correctCount = 0
                    wrongCount = 0
                } label: {
                    Text("ReGame")
                }
                .disabled(startButtonDisabled)
            }
        }
        .padding()
        .buttonStyle(.borderedProminent)
    }
    
    func questionGenerator( problem: Problem ) {
            
        let randomAnswerIndex = Int.random(in: 0...3)

        var tempQuestionArray: [Int] = [0,0,0,0]

        let realAnswer = problem.answer
        
        switch realAnswer {
        
        case 0...2 :
            tempQuestionArray = [0,1,2,3]
        default :
            for index in 0...3 {
                tempQuestionArray[index] = problem.answer + (index - randomAnswerIndex)
            }
            tempQuestionArray[randomAnswerIndex] = realAnswer
        }
        questionArray = tempQuestionArray
    }
    
    
    func buttonPressed(_ selectedNumber: Int) {
        
        if selectedNumber == imageBundle[currentProblemIndex].answer {
            correctCount += 1
        } else {
            wrongCount += 1
        }
        
        guard currentProblemIndex != imageBundle.count - 1 else {
            
            currentStatus = GameStatus.end
            startButtonDisabled = false
            
            currentProblemIndex = 0
            
            return
        }
        
        currentProblemIndex += 1
        questionGenerator(problem: imageBundle[currentProblemIndex])
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
