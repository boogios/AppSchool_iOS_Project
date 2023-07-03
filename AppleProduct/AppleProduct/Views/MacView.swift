//
//  MacBookViews.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import SwiftUI

struct MacView: View {
    var body: some View {
        List(macBook) { mac in
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: URL(string: mac.image), scale: 1.0)
                    VStack {
                        Text("\(mac.name)")
                        Text("\(mac.usedChip)")
                    }
                }
                Text("디스플레이 : \(String(format: "%.1f", mac.display))cm")
                Text("최대 \(mac.batteryUseTime)시간의 배터리 사용 시간")
                Text("\(mac.camera)")
            }
        }
        .navigationBarTitle("Mac")
        .listStyle(.plain)
    }
}

struct MacView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MacView()
        }
    }
}
