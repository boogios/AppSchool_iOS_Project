//
//  WatchView.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import SwiftUI

struct AppleWatchView: View {
    var body: some View {
        List(appleWatch) { watch in
            VStack(alignment: .leading) {
                Text("\(watch.name)")
                    .font(.title)
                    .bold()
                HStack {
                    VStack(alignment: .leading) {
                    Text("색상 : \(watch.color)")
                            .font(.system(size: 15))
                    Text("소재: \(watch.material)")
                    Text("사이즈 : \(watch.size)")
                        Text("\(watch.price)원")
                    }
                    Spacer()
                    Section {
                        AsyncImage(url: watch.imageString) { image in
                            image
                                .resizable()
                                .frame(width: 70, height: 60)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
        }
        .navigationTitle("Apple Watch")
        .listStyle(.plain)
    }
}

struct AppleWatchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AppleWatchView()
        }
    }
}
