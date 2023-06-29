//
//  DetailView.swift
//  PokemonDic
//
//  Created by 변상우 on 2023/06/27.
//

import SwiftUI

struct DetailView: View {
    
    var pokemon: String
    var power: Int {
        get {
            switch pokemon {
            case "파이리":
                return 10
            case "꼬부기":
                return 20
            case "리자몽":
                return 30
            case "푸린":
                return 40
            default:
                return 50
            }
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(pokemon)을 선택함.")
            Spacer()
            Text("\(pokemon)의 능력치는 \(power)입니다")
            Spacer()
        }
        .font(.largeTitle)
        .navigationTitle("\(pokemon)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(pokemon: "고라파덕")
        }
    }
}
