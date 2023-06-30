//
//  ContentView.swift
//  MovieChart
//
//  Created by 변상우 on 2023/06/30.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            AsyncImage(url: movie.imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400)
                    .padding()
            } placeholder: {
                ProgressView()
            }
            List {
                ForEach(movie.genre) { genre in
                    NavigationLink {
                        GenreView(genre: genre)
                    } label: {
                        Text("\(genre.genre)")
                    }
                    
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("\(movie.title)")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView()
        }
    }
}
