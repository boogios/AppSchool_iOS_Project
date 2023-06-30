//
//  ActorListView.swift
//  MovieChart
//
//  Created by 변상우 on 2023/06/30.
//

import SwiftUI

struct ActorListView: View {
    
    var actor: Actor
    
    var body: some View {
        List {
            AsyncImage(url: actor.imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            Text("이름: \(actor.actorName)")
            Text("배역: \(actor.nickanme)")
            Text("명대사\n\n\(actor.quotes)")

        }
        .listStyle(.plain)
        .navigationTitle("\(actor.actorName)")
    }
}

struct ActorListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ActorListView(actor: Actor(actorName: "박보영", nickanme: "환승희", quotes: "이 사람이구나 느낌이 오는 시간이 3초래", imageURLString: "https://d3ihz389yobwks.cloudfront.net/1597431301991902226585749700.jpg"))
        }
    }
}
