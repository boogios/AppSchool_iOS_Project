//
//  MovieListView.swift
//  MovieChart
//
//  Created by 변상우 on 2023/06/30.
//

import SwiftUI

struct MovieListView: View {
    
    var movieTitle: MovieTitle
    
    var body: some View {
        List {
            if movieTitle.actors.count > 0 {
                ForEach(movieTitle.actors) { actors in
                    NavigationLink {
                        ActorListView(actor: actors)
                    } label: {
                        Text("\(actors.actorName)")
                    }
                    
                }
            } else {
                Text("해당 장르의 영화가 없습니다.")
            }
        }
        .listStyle(.plain)
        .navigationTitle("\(movieTitle.movieTitle)")
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MovieListView(movieTitle: MovieTitle(movieTitle: "너의 결혼식", imageURLString: "https://d3ihz389yobwks.cloudfront.net/1597431301991902226585749700.jpg", actors: []))
        }
    }
}
