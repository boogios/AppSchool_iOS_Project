//
//  ContentView.swift
//  OXGameSwiftUI
//
//  Created by 변상우 on 2023/06/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var randomNumber1 = Int.random(in: 1...9)
    @State var randomNumber2 = Int.random(in: 1...9)
    
    @State var heartCount = 10
    @State var buttonDisabled = false
    
    var progress: String {
        get {
            var heart = ""
            if heartCount > 0 {
                heart = String(repeating: "❤️", count: heartCount)
                heartCount -= 1
            }
            
            return heart
        }
    }
    
    var operatorList = ["+", "-", "X", "/"]
    
    var randomAnswer: (Int, String) {
        get {
            var answer: Int = 0
            let wrong = Int.random(in: -3...3)
            let randomOperator = operatorList[Int.random(in: 0...3)]
            
            switch randomOperator {
            case "+":
                if Bool.random() == true {
                    answer = randomNumber1 + randomNumber2
                } else {
                    answer = randomNumber1 + randomNumber2 + wrong
                }
            case "-":
                if Bool.random() == true {
                    answer = randomNumber1 - randomNumber2
                } else {
                    answer = randomNumber1 - randomNumber2 + wrong
                }
            case "X":
                if Bool.random() == true {
                    answer = randomNumber1 * randomNumber2
                } else {
                    answer = randomNumber1 * randomNumber2 + wrong
                }
            case "/":
                if Bool.random() == true {
                    answer = randomNumber1 / randomNumber2
                } else {
                    answer = randomNumber1 / randomNumber2 + wrong
                }
            default:
                print("")
            }
            return (answer, randomOperator)
        }
    }
    
    @State var correctCount = 0
    @State var wrongCount = 0
    
    var body: some View {
        VStack {
            let realAnswer = randomAnswer.0
            let randomOperator = randomAnswer.1
            Text("OX GAME")
            Spacer()
            Text("\(randomNumber1) \(randomOperator) \(randomNumber2) = \(realAnswer)")
                .padding(30)
            HStack {
                Spacer()
                Button {
                    isCorrect(operatorString: randomOperator ,selectedButton: true, realAnswer)
                    createNewNumber()
                    if heartCount == 0 { buttonDisabled = true }
                } label: {
                    Text("O")
                        .frame(width: 100, height: 50)
                }
                .disabled(buttonDisabled)
                
                Spacer()
                Button {
                    isCorrect(operatorString: randomOperator, selectedButton: false, realAnswer)
                    createNewNumber()
                    if heartCount == 0 { buttonDisabled = true }
                } label: {
                    Text("X")
                        .frame(width: 100, height: 50)
                }
                .disabled(buttonDisabled)
                
                Spacer()
            }
            .buttonStyle(.borderedProminent)
            
            HStack {
                Spacer()
                Text("맞춘 개수 \(correctCount)개")
                Spacer()
                Text("틀린 개수 \(wrongCount)개")
                Spacer()
            }
            .font(.title)
            .padding(.top, 50)
            
            Text("\(progress)")
                .font(.title)
                .padding(.top)
            
            Spacer()
            
            Button {
                newGame()
            } label: {
                Text("NEW GAME")
            }
            .buttonStyle(.borderedProminent)

        }
        .padding()
        .font(.largeTitle)
    }
    
    func isCorrect(operatorString: String, selectedButton: Bool, _ answer: Int) {
        switch operatorString {
        case "+":
            switch selectedButton {
            case true:
                if (randomNumber1 + randomNumber2 == answer) {
                    correctCount += 1
                } else {
                    wrongCount += 1
                }
            case false:
                if (randomNumber1 + randomNumber2 != answer) {
                    correctCount += 1
                } else {
                    wrongCount += 1
                }
            }
        case "-":
            switch selectedButton {
            case true:
                if (randomNumber1 - randomNumber2 == answer) {
                    correctCount += 1
                } else {
                    wrongCount += 1
                }
            case false:
                if (randomNumber1 - randomNumber2 != answer) {
                    correctCount += 1
                } else {
                    wrongCount += 1
                }
            }
        case "X":
            switch selectedButton {
            case true:
                if (randomNumber1 * randomNumber2 == answer) {
                    correctCount += 1
                } else {
                    wrongCount += 1
                }
            case false:
                if (randomNumber1 * randomNumber2 != answer) {
                    correctCount += 1
                } else {
                    wrongCount += 1
                }
            }
        case "/":
            switch selectedButton {
            case true:
                if (randomNumber1 / randomNumber2 == answer) {
                    correctCount += 1
                } else {
                    wrongCount += 1
                }
            case false:
                if (randomNumber1 / randomNumber2 != answer) {
                    correctCount += 1
                } else {
                    wrongCount += 1
                }
            }
        default:
            print("")
        }
    }
    
    func createNewNumber() {
        randomNumber1 = Int.random(in: 1...9)
        randomNumber2 = Int.random(in: 1...9)
        
        heartCount -= 1
    }
    
    func newGame() {
        randomNumber1 = Int.random(in: 1...9)
        randomNumber2 = Int.random(in: 1...9)
        
        correctCount = 0
        wrongCount = 0
        
        heartCount = 10
        buttonDisabled = false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
