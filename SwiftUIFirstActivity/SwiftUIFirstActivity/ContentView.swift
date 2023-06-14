import SwiftUI
import AVFoundation

let members: [[String: String]] = [
    [
        "name" : "suji",
        "nickname" : "jangsupungdengE"
    ],
    [
        "name" : "haeun",
        "nickname" : "hani"
    ],
    [
        "name" : "sangwoo",
        "nickname" : "sanguh"
    ],
    [
        "name" : "sungeun",
        "nickname" : "womensilver"
    ],
    [
        "name" : "soyeon",
        "nickname" : "chicorita"
    ],
    [
        "name" : "minseok",
        "nickname" : "mindol"
    ],
    [
        "name" : "sojung",
        "nickname" : "chaeso"
    ],
]

struct ContentView: View {
    
//    @State var name: String = ""
//    @State var nickname: String = ""
    @State var message: String = ""
    let speechSynth = AVSpeechSynthesizer()
    
    @State var selectedIndex: Int = 0
    
    var name: String {
        getName(selectedIndex)
    }
    
    var nickname: String {
        getNickname(selectedIndex)
    }
    
    var body: some View {
        VStack {
            Group {
                // 버튼은 액션과 label을 각각
                // 클로저로 받을 수 있기 때문에
                // 아래와 같이 간략화된 모양으로 쓸 수 있음
                Button {
                    // action
//                    sayHello("suji", "jangsupungdengE")
                    selectedIndex = 0
                } label: {
                    // label
                    Text("\(getName(0))")
                }
//                Button("수지") {
//                    sayHello("suji", "jangsupungdengE")
//                }
                Button("하은") {
//                    sayHello("haeun", "hani")
                    selectedIndex = 1
                }
                Button("상우") {
                    sayHello("sangwoo", "sanguh")
                }
                Button("성은") {
                    sayHello("sungeun", "womensilver")
                }
                Button("소연") {
                    sayHello("soyeon", "chicorita")
                }
                Button("민석") {
                    sayHello("minseok", "mindol")
                }
                Button("소정") {
                    sayHello("sojung", "chaeso")
                }
//                Text("\(message)")
                Text("\(name), \(nickname)")
            }
            .padding()
            
//            TextField("Input your nickName", text: $textFieldText)
        }
        .font(.largeTitle)
        .padding()
    }
    
    func sayHello(_ name: String, _ nickname: String) {
        // $를 붙이는 상황은 타입이 Binding<String>일 때 씀
        // self.name = name
        // self.nickname = nickname
        // message = "Hello \($name.wrappedValue) \($nickname.wrappedValue)"
        
        message = "Hello \(name), \(nickname)"
        
        print(message)
        
        let utterance = AVSpeechUtterance(string: message)
        speechSynth.speak(utterance)
    }
    
    func getName(_ index: Int) -> String {
        
        let member = members[index]
        
        if let name = member["name"] {
            return name
        }
        // let name = member["name"] ?? ""
        return ""
    }
    
    func getNickname(_ index: Int) -> String {
        let member = members[index]
        return member["nickname"] ?? ""
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
