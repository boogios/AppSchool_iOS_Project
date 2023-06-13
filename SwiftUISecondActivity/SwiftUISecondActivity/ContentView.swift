import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var number: Int = 0
    @State var result: String = "Result"
    var speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            HStack {
                Group {
                    Button("1") {
                        result = multiplyFunction(num: 1).joined(separator: "\n")
                    }
                    Button("2") {
                        result = multiplyFunction(num: 2).joined(separator: "\n")
                    }
                    Button("3") {
                        result = multiplyFunction(num: 3).joined(separator: "\n")
                    }
                    Button("4") {
                        result = multiplyFunction(num: 4).joined(separator: "\n")
                    }
                    Button("5") {
                        result = multiplyFunction(num: 5).joined(separator: "\n")
                    }
                    Button("6") {
                        result = multiplyFunction(num: 6).joined(separator: "\n")
                    }
                    Button("7") {
                        result = multiplyFunction(num: 7).joined(separator: "\n")
                    }
                    Button("8") {
                        result = multiplyFunction(num: 8).joined(separator: "\n")
                    }
                    Button("9") {
                        result = multiplyFunction(num: 9).joined(separator: "\n")
                    }
                }
                .padding(5)
            }
            Text("\(result)")
            
            Spacer()
            Button("Speech") {
                speakResult(result)
            }
            
        }
        .font(.largeTitle)
        .padding()
    }
    
    func multiplyFunction(num: Int) -> [String] {
        
        var resultArray: [String] = []
        var result: Int = 0
        
        for i in 1...9 {
            result = num * i
            resultArray.append("\(num) * \(i) = \(result)")
        }
        
        return resultArray
    }
    
    func speakResult(_ result: String) {
        let utterance = AVSpeechUtterance(string: result)
        speechSynth.speak(utterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
