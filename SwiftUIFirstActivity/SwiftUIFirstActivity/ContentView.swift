import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var name: String = ""
    @State var nickname: String = ""
    @State var message: String = ""
    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Group {
                Button("수지") {
                    sayHello("suji", "jangsupungdengE")
                }
                Button("하은") {
                    sayHello("haeun", "hani")
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
                Text("\(message)")
            }
            .padding()
        }
        .font(.largeTitle)
        .padding()
    }
    
    func sayHello(_ name: String, _ nickname: String) {
        self.name = name
        self.nickname = nickname
        message = "Hello \($name.wrappedValue) \($nickname.wrappedValue)"
        
        print(message)
        
        let utterance = AVSpeechUtterance(string: message)
        speechSynth.speak(utterance)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
