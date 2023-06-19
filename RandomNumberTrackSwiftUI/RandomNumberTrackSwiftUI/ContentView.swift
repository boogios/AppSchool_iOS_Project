//
//  ContentView.swift
//  RandomNumberTrackSwiftUI
//
//  Created by 변상우 on 2023/06/19.
//

import SwiftUI

struct ContentView: View {
    
    var resultArray = ["랜덤 숫자를 맞춰보세요!", "1개 정답입니다!", "2개 정답입니다!", "3개 정답입니다!", "4개 정답입니다!", "모두 정답입니다!!"]
    
    @State var answer = [
        Int.random(in: 0...10),
        Int.random(in: 0...10),
        Int.random(in: 0...10),
        Int.random(in: 0...10),
        Int.random(in: 0...10),
    ]
    
    let numberList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    var correctCount: Int {
        get {
            var correct: Int = 0
            
            if answer[0] == selectedNumber1 {
                correct += 1
            }
            
            if answer[1] == selectedNumber2 {
                correct += 1
            }
            
            if answer[2] == selectedNumber3 {
                correct += 1
            }
            
            if answer[3] == selectedNumber4 {
                correct += 1
            }
            
            if answer[4] == selectedNumber5 {
                correct += 1
            }
            
            return correct
        }
    }
    
    @State private var selectedNumber1: Int = 0
    @State private var selectedNumber2: Int = 0
    @State private var selectedNumber3: Int = 0
    @State private var selectedNumber4: Int = 0
    @State private var selectedNumber5: Int = 0
    
    var body: some View {
        VStack {
            if (selectedNumber1 == 0 && selectedNumber2 == 0 && selectedNumber3 == 0 && selectedNumber4 == 0 && selectedNumber5 == 0) {
                Text("\(resultArray[0])")
                    .font(.largeTitle)
            } else {
                Text("\(resultArray[correctCount])")
                    .font(.largeTitle)
            }
            Group {
                Picker("정답을 맞춰보세요!", selection: $selectedNumber1) {
                    ForEach(numberList, id: \.self) {
                        Text("\($0)")
                    }
                }
                Picker("정답을 맞춰보세요!", selection: $selectedNumber2) {
                    ForEach(numberList, id: \.self) {
                        Text("\($0)")
                    }
                }
                Picker("정답을 맞춰보세요!", selection: $selectedNumber3) {
                    ForEach(numberList, id: \.self) {
                        Text("\($0)")
                    }
                }
                Picker("정답을 맞춰보세요!", selection: $selectedNumber4) {
                    ForEach(numberList, id: \.self) {
                        Text("\($0)")
                    }
                }
                Picker("정답을 맞춰보세요!", selection: $selectedNumber5) {
                    ForEach(numberList, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            .pickerStyle(.segmented)
            .padding(5)
            
            Text("현재 선택은 \(selectedNumber1) \(selectedNumber2) \(selectedNumber3) \(selectedNumber4) \(selectedNumber5) 입니다.")
                .padding()
            Button {
                createNewGame()
            } label: {
                Text("새로운 게임")
            }
            .buttonStyle(.borderedProminent)
            .padding()
            Text("이번 정답은 \(answer[0]) \(answer[1]) \(answer[2]) \(answer[3]) \(answer[4]) 입니다")
        }
        .padding()
    }
    
     func createNewGame() {
        answer = [
            Int.random(in: 0...10),
            Int.random(in: 0...10),
            Int.random(in: 0...10),
            Int.random(in: 0...10),
            Int.random(in: 0...10),
        ]
        selectedNumber1 = 0
        selectedNumber2 = 0
        selectedNumber3 = 0
        selectedNumber4 = 0
        selectedNumber5 = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
