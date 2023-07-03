//
//  ContentView.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    MacView()
                } label: {
                    Text("Mac")
                }

                NavigationLink {
                    IPhoneView()
                } label: {
                    Text("iPhone")
                }
                
                NavigationLink {
                    IPadVIew()
                } label: {
                    Text("iPad")
                }
                
                NavigationLink {
                    AirPodsView()
                } label: {
                    Text("AirPods")
                }
                
                NavigationLink {
                    AppleWatchView()
                } label: {
                    Text("Apple Watch")
                }
            }
            .navigationTitle("Apple")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
