//
//  ContentView.swift
//  RPSGameSwiftUI
//
//  Created by 변상우 on 2023/06/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndex = 0
    @State private var computerChoice: Int = Int.random(in: 0...2)
    @State var result: String = ""
    
    let rpsArray = ["가위", "바위", "보"]
    let comImageArray = ["com_scissors", "com_rock", "com_paper"]
    let personImageArray = ["scissors", "rock", "paper"]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("컴퓨터")
                Spacer()
                Image("vs")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                Spacer()
                Text("인간")
                Spacer()
            }
            Spacer()
            HStack {
                Image(comImageArray[computerChoice])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                Image("vs")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                Image(personImageArray[selectedIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
            }
            Spacer()
            Text(result)
            HStack {
                Group {
                    Spacer()
                    Button {
                        buttonPressed(0)
                    } label: {
                        Text("가위")
                            .frame(width: 80, height: 80)
                    }
                    Button {
                        buttonPressed(1)
                    } label: {
                        Text("바위")
                            .frame(width: 80, height: 80)
                    }
                    Button {
                        buttonPressed(2)
                    } label: {
                        Text("보")
                            .frame(width: 80, height: 80)
                    }
                    Spacer()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .font(.largeTitle)
    }
    
    func buttonPressed(_ selected: Int) {
        selectedIndex = selected
        computerChoice = Int.random(in: 0...2)

        guard selected != computerChoice else {
            result = "무승부입니다!"
            return
        }
        
        // 컴퓨터: 가위
        if computerChoice == 0 {
            if selected == 1 {
                result = "이겼습니다"
            } else {
                result = "졌습니다ㅠ"
            }
        }
        
        // 컴퓨터: 바위
        if computerChoice == 1 {
            if selected == 2 {
                result = "이겼습니다"
            } else {
                result = "졌습니다ㅠ"
            }
        }
        
        // 컴퓨터: 보
        if computerChoice == 2 {
            if selected == 0 {
                result = "이겼습니다"
            } else {
                result = "졌습니다ㅠ"
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
