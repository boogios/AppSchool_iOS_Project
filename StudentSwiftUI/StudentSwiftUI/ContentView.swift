//
//  ContentView.swift
//  StudentSwiftUI
//
//  Created by 변상우 on 2023/06/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var message: String = "Select a student name"
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(message)")
                .font(.headline)
            // students 배열의 내용을 하나씩 꺼내서 목록 만들기
            // in 을 보면 클로저인것을 알 수 있음
            List(students) { student in
                Button {
                    message = "Hello, \(student.name) \(student.number)"
                } label: {
                    HStack {
                        Text("\(student.name)")
                        Spacer()
                        Text("\(student.number)")
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
