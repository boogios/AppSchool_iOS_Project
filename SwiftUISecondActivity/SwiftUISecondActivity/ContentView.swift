import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var number: Int = 0
    @State var resultString: String = ""
    @State var selectedIndex: Int = 4
    
    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("Multiply App")
                .font(.headline)
                .padding()
            HStack {
                Group {
                    Button {
                        multiplyFunction(1)
                    } label: {
                        Text("1")
                    }
                    
                    Button {
                        multiplyFunction(2)
                    } label: {
                        Text("2")
                    }
                    
                    Button {
                        multiplyFunction(3)
                    } label: {
                        Text("3")
                    }
                    
                    Button {
                        multiplyFunction(4)
                    } label: {
                        Text("4")
                    }
                    
                    Button {
                        multiplyFunction(5)
                    } label: {
                        Text("5")
                    }
                    
                    Button {
                        multiplyFunction(6)
                    } label: {
                        Text("6")
                    }
                    
                    Button {
                        multiplyFunction(7)
                    } label: {
                        Text("7")
                    }
                    
                    Button {
                        multiplyFunction(8)
                    } label: {
                        Text("8")
                    }
                    
                    Button {
                        multiplyFunction(9)
                    } label: {
                        Text("9")
                    }
                }
                .padding(5)
            }
            
            if selectedIndex > 0 {
                Text("\(resultString)")
            }
            
            Spacer()
            Button("Speech") {
                speakResult(resultString)
            }
            
        }
        .font(.largeTitle)
        .padding()
    }
    
    func multiplyFunction(_ num: Int) {
        resultString = ""
        var result: Int = 0
        
        for i in 1...9 {
            result = num * i
            resultString += ("\(num) \u{D7} \(i) = \(result)\n")
        }
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
