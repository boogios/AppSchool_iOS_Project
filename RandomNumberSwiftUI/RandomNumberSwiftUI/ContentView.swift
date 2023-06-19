//
//  ContentView.swift
//  RandomNumberSwiftUI
//
//  Created by 변상우 on 2023/06/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var answer = Int.random(in: 0...10)
    @State var answerStatus = 0
    
    var resultArray = ["랜덤 숫자를 맞춰보세요!", "맞췄습니다!", "틀렸습니다ㅠ", "정답보다 큽니다!", "정답보다 작습니다!"]
    
    let numberList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(resultArray[answerStatus])")
            
            HStack {
                Button {
                    isCorrect(0)
                    print("\(answer)")
                } label: {
                    Text("0")
                }
                Button {
                    isCorrect(1)
                } label: {
                    Text("1")
                }
                Button {
                    isCorrect(2)
                } label: {
                    Text("2")
                }
            }
            HStack {
                Button {
                    isCorrect(3)
                } label: {
                    Text("3")
                }
                Button {
                    isCorrect(4)
                } label: {
                    Text("4")
                }
                Button {
                    isCorrect(5)
                } label: {
                    Text("5")
                }
            }
            HStack {
                Button {
                    isCorrect(6)
                } label: {
                    Text("6")
                }
                Button {
                    isCorrect(7)
                } label: {
                    Text("7")
                }
                Button {
                    isCorrect(8)
                } label: {
                    Text("8")
                }
            }
            HStack {
                Button {
                    isCorrect(9)
                } label: {
                    Text("9")
                }
                Button {
                    isCorrect(10)
                } label: {
                    Text("10")
                }
            }
            Spacer()
            Button {
                answer = Int.random(in: 0...10)
                answerStatus = 0
            } label: {
                Text("새로운 맞추기 게임 시작")
            }
            Spacer()

        }
        .buttonStyle(.borderedProminent)
        .font(.largeTitle)
    }
    
    func isCorrect(_ selectedNumber: Int) {
        guard selectedNumber == answer else {
            if selectedNumber > answer {
                return answerStatus = 3
            } else {
                return answerStatus = 4
            }
        }
        answerStatus = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
