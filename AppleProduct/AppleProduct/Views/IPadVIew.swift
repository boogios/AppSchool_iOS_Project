//
//  IPadVIews.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import SwiftUI

struct IPadVIew: View {
    var body: some View {
        List(iPad) { ipad in
            HStack {
                VStack(alignment: .leading) {
                    Text("\(ipad.name)")
                        .font(.title)
                        .bold()
                    Text("\(ipad.color)의 색상")
                    Text("\(ipad.price)₩")
                    Text("\(ipad.storage)GB")
                    Text("\(String(format: "%.2f", ipad.displaySize))cm")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    AsyncImage(url: URL(string: ipad.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
        .navigationTitle("iPad")
        .listStyle(.plain)
    }
}

struct IPadVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            IPadVIew()
        }
    }
}
