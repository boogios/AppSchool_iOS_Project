//
//  GenreView.swift
//  MovieChart
//
//  Created by 변상우 on 2023/06/30.
//

import SwiftUI

struct GenreView: View {
    
    var genre: Genre
    
    var body: some View {
        List {
            if genre.movieTitles.count > 0 {
                ForEach(genre.movieTitles) { movieTitle in
                    NavigationLink {
                        MovieListView(movieTitle: movieTitle)
                    } label: {
                        Text("\(movieTitle.movieTitle)")
                    }
                    
                }
            } else {
                Text("해당 장르의 영화가 없습니다.")
            }
        }
        .listStyle(.plain)
        .navigationTitle("\(genre.genre)")
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GenreView(genre: Genre(genre: "멜로/로맨스", movieTitles: [MovieTitle(movieTitle: "너의 결혼식", imageURLString: "https://ojsfile.ohmynews.com/STD_IMG_FILE/2018/0826/IE002383159_STD.jpg", actors: [])]))
        }
    }
}
