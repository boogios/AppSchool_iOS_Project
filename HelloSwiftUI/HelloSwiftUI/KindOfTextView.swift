//
//  KindOfTextView.swift
//  HelloSwiftUI
//
//  Created by 변상우 on 2023/06/13.
//

import SwiftUI
import AVFoundation

struct KindOfTextView: View {
    
    @State var name: String = ""
    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Input your name", text: $name)

            Text("Hello \(name)")
            
            Spacer()
            
            Button("Say Hello") {
                sayHello()
            }
            
            Spacer()
        }
        .font(.largeTitle)
        .padding(30)
    }
    
    func sayHello() {
        let message: String = "Hello \(name)"
        
        let utterance = AVSpeechUtterance(string: message)
        speechSynth.speak(utterance)
    }
}

struct KindOfTextView_Previews: PreviewProvider {
    static var previews: some View {
        KindOfTextView()
    }
}
