//
//  ContentView.swift
//  iOS_034_ByeonSangwoo
//
//  Created by 변상우 on 2023/07/02.
//

import SwiftUI

/// 포켓몬 대전 앱
/// 지우와 로켓단(로사, 로이, 냐옹이)의 싸움
///
/// 포켓몬 상성
/// 물, 풀, 불 3가지 속성이 있고
/// 물 vs 풀 = 풀 승
/// 풀 vs 불 = 불 승
/// 불 vs 물 = 물 승
/// 물 -> 불 -> 풀 -> 물 순서로 상성이 존재
///
/// 지우팀: [파이리(불), 꼬부기(물), 이상해씨(풀)]
/// 로켓단팀: [파이어(불), 마자용(물), 모다피(풀)]

struct ContentView: View {
    
    // 게임 시작 상태값
    @State var gameStatus = GameStatus.Before
    
    // 로켓단팀 포켓몬은 랜덤 설정, 지우팀 포켓몬은 아래에서 선택 가능
    @State var randomPokemon = ""
    @State var selectedPokemon = "피카츄"
    
    // 포켓몬을 눌렀을 때의 인덱스 값
    @State var selectedIndex = 0
    
    // 지우, 로켓단 대결 결과 값
    @State var jiwooResult = Result.waiting
    @State var rocketDanResult = Result.waiting
    
    // 최종 결과 값 -> 지우 승리 true / 지우 패배 false
    @State var finalResult = true
    
    // 지우가 포켓몬을 고르면 승패 이미지, 로켓단 로켓몬 캐릭터 안보이게 하는 상태 값
    // 지우가 포켓몬 선택 -> false
    // 전투하기 누르면 -> true
    @State var selectedStatus = false
    
    // 전투하기 버튼 상태값 (초기값 선택 불가 true / 포켓몬 고르면 false)
    @State var buttonStatus = true
    
    // 지면 데미지가 10만큼씩 쌓임
    @State var jiwooDamage = 0
    @State var rocketDanDamage = 0
    
    // 전체 체력
    var totalHealth = 100
    
    // 지우, 로켓단 전체 체력 연산 프로퍼티
    var jiwooHealth: Int {
        return totalHealth - jiwooDamage
    }
    var rocketDanHealth: Int {
        return totalHealth - rocketDanDamage
    }
    
    var body: some View {
        switch gameStatus {
        // 게임 시작 전 초기 화면
        case .Before:
            VStack {
                Image("main")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 300)
                Button {
                    gameStatus = GameStatus.Proceeding
                    print("ㅇㅇ")
                } label: {
                    Image("gamestart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200)
                }
                .frame(height: 100)
            }
        // 게임 진행 화면
        case .Proceeding:
            VStack {
                HStack {
                    Image("로켓단")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    Spacer()
                    VStack {
                        Text("로켓단 TEAM")
                            .font(.system(size: 25))
                            .bold()
                            .padding(.bottom, 20)
                        Text("로사, 로이!\n난 냐옹이다옹!")
                    }
                    Spacer()
                }
                ProgressView("남은 체력: \(rocketDanHealth)", value: Float(rocketDanHealth), total: 100)
                    .tint(.red)
                
                Spacer()
                
                if selectedStatus == true {
                    HStack {
                        Image(randomPokemon)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100)
                            .padding(.leading, 50)
                        Image("\(rocketDanResult)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        Spacer()
                    }
                    .hidden()
                } else {
                    HStack {
                        Image(randomPokemon)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100)
                            .padding(.leading, 50)
                        Image("\(rocketDanResult)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        Spacer()
                    }
                }
                
                Image("vs")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                
                HStack {
                    Spacer()
                    if selectedStatus == true {
                        Image("\(jiwooResult)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .hidden()
                    } else {
                        Image("\(jiwooResult)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                    Image(selectedPokemon)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100)
                        .padding(.trailing, 50)
                }
                
                ProgressView("남은 체력: \(jiwooHealth)", value: Float(jiwooHealth), total: 100)
                    .tint(.red)
                HStack {
                    Image("지우")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Spacer()
                    VStack {
                        Text("지우 TEAM")
                            .font(.system(size: 25))
                            .bold()
                            .padding(.bottom, 20)
                        Text("포켓몬, 넌 내꺼야!\n 가랏, \(selectedPokemon)!")
                    }
                    Spacer()
                }
                HStack {
                    Button {
                        selectPokemon(0)
                    } label: {
                        Image("파이리")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90)
                            .padding(5)
                    }
                    .border(.gray, width: 2)
                    
                    Button {
                        selectPokemon(1)
                    } label: {
                        Image("꼬부기")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90)
                            .padding(5)
                    }
                    .border(.gray, width: 2)
                    
                    Button {
                        selectPokemon(2)
                    } label: {
                        Image("이상해씨")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90)
                            .padding(5)
                    }
                    .border(.gray, width: 2)
                }
                Button {
                    fight()
                } label: {
                    Text("전투하기")
                        .frame(width: 300, height: 40)
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                .disabled(buttonStatus)
                
                
            }
            .padding()
        // 게임 종료 화면, 초기 화면으로 또는 다시하기 가능
        case .After:
            VStack {
                Image(finalResult ? "winEnd" : "loseEnd")
                    .resizable()
                    .scaledToFit()
                HStack {
                    Spacer()
                    Button {
                        gameStatus = GameStatus.Before
                        reGame()
                    } label: {
                        Text("처음으로 돌아가기")
                            .frame(width: 150, height: 40)
                    }
                    Spacer()
                    Button {
                        gameStatus = GameStatus.Proceeding
                        reGame()
                    } label: {
                        Text("다시하기")
                            .frame(width: 150, height: 40)
                    }
                    Spacer()
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                

            }
        }
    }
    
    // 지우의 포켓몬을 고를 때 호출 되는 함수
    // 지우의 포켓몬 이미지 및 텍스트 변경
    func selectPokemon(_ selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        selectedPokemon = jiwooTeam[selectedIndex].name
        
        // 상태값 변경
        selectedStatus = true // 로켓단 포켓몬, 결과 값 Hidden 처리
        buttonStatus = false // 전투하기 버튼 활성화
    }
    
    // 포켓몬끼리의 대결 이후 결과값을 보여주는 함수
    // 랜덤으로 로켓단의 포켓몬을 생성
    //
    func fight() {
        let randomIndex = Int.random(in: 0...2)
        randomPokemon = rocketDanTeam[randomIndex].name
        
        // 상태값 변경
        selectedStatus = false // 로켓단 포켓몬, 결과 값 보이게 하는 값
        buttonStatus = true // 전투하기 버튼 비활성화
        
        // 비길 경우 guard 문으로 처리 후 바로 함수 종료
        guard rocketDanTeam[randomIndex].attribute != jiwooTeam[selectedIndex].attribute else {
            jiwooResult = Result.draw
            rocketDanResult = Result.draw
            return
        }
        
        // 로켓단이 랜덤으로 내는 포켓몬에 따라 결과 처리 하는 switch문
        switch rocketDanTeam[randomIndex].attribute {
        case "fire":
            if jiwooTeam[selectedIndex].attribute == "water" {
                // 지우팀 승
                jiwooResult = Result.win
                rocketDanResult = Result.lose
                
                // 로켓단 패배, 체력 마이너스
                rocketDanDamage += 10
            } else {
                jiwooResult = Result.lose
                rocketDanResult = Result.win
                
                // 지우 패배, 체력 마이너스
                jiwooDamage += 10
            }
        case "water":
            if jiwooTeam[selectedIndex].attribute == "grass" {
                // 지우팀 승
                jiwooResult = Result.win
                rocketDanResult = Result.lose
                
                // 로켓단 패배, 체력 마이너스
                rocketDanDamage += 10
            } else {
                jiwooResult = Result.lose
                rocketDanResult = Result.win
                
                // 지우 패배, 체력 마이너스
                jiwooDamage += 10
            }
        case "grass":
            if jiwooTeam[selectedIndex].attribute == "fire" {
                // 지우팀 승
                jiwooResult = Result.win
                rocketDanResult = Result.lose
                
                // 로켓단 패배, 체력 마이너스
                rocketDanDamage += 10
            } else {
                jiwooResult = Result.lose
                rocketDanResult = Result.win
                
                // 지우 패배, 체력 마이너스
                jiwooDamage += 10
            }
        default:
            print("")
        }
        
        // 로켓단이나 지우의 체력이 0이 되면 게임 종료
        if (rocketDanDamage == 100 || jiwooDamage == 100) {
            if rocketDanDamage == 100 {
                finalResult = true // 지우팀 승리 이미지로 변경
            } else {
                finalResult = false // 지우팀 패배 이미지로 변경
            }
            gameStatus = GameStatus.After // 게임 상태값 종료로 변경
        }
    }
    
    // 새로운 게임 시작하면 호출되는 함수로 모든 변수를 초기값으로 모두 변경
    func reGame() {
        randomPokemon = ""
        selectedPokemon = "피카츄"
        
        jiwooResult = Result.waiting
        rocketDanResult = Result.waiting
        
        finalResult = true
        
        selectedStatus = false
        buttonStatus = true
        
        jiwooDamage = 0
        rocketDanDamage = 0
    }
    
}

enum GameStatus {
    case Before
    case Proceeding
    case After
}

enum Result {
    case win
    case lose
    case draw
    case waiting
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
