//
//  ContentView.swift
//  PokemonDic
//
//  Created by 변상우 on 2023/06/27.
//

import SwiftUI

struct ContentView: View {
    
    let pokemons: [String] = [
        "잠만보",
        "파이리",
        "꼬부기",
        "마자용",
        "메타몽",
        "야도란",
        "피죤투",
        "뮤",
        "레큐쟈",
        "리자몽",
        "피카츄",
        "큐레무",
        "뮤츠",
        "치코리타",
        "푸린",
        "토게피",
        "썬더",
        "이브이",
        "홍수몬",
        "펄기아",
        "기라티나",
        "냐옹이",
        "이상해씨",
        "아르세우스",
        "지우",
        "이상해풀",
        "근육몬",
        "고라파덕",
        "거북왕",
        "야돈",
        "내루미",
    ]
    
    var body: some View {
        NavigationStack {
            List(pokemons, id: \.self) { pokemon in
                NavigationLink {
                    // Destination
                    DetailView(pokemon: pokemon)
                } label: {
                    Text("\(pokemon)")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
