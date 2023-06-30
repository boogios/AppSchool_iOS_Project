//
//  MovieData.swift
//  MovieChart
//
//  Created by 변상우 on 2023/06/30.
//

import Foundation

protocol ImageURL {
    var imageURLString: String { get set }
    var imageURL: URL { get }
}

struct Movie: ImageURL {
    var title: String
    var imageURLString: String
    var imageURL: URL {
        URL(string: imageURLString)!
    }
    var genre: [Genre]
}

struct Genre: Identifiable {
    var id: UUID = UUID()
    var genre: String
    var movieTitles: [MovieTitle]
}

struct MovieTitle: Identifiable, ImageURL {
    var id: UUID = UUID()
    var movieTitle: String
    var imageURLString: String
    var imageURL: URL {
        URL(string: imageURLString)!
    }
    var actors: [Actor]
}

struct Actor: Identifiable, ImageURL {
    var id: UUID = UUID()
    var actorName: String
    var nickanme: String
    var quotes: String
    var imageURLString: String
    var imageURL: URL {
        URL(string: imageURLString)!
    }
}

let movie: Movie = Movie(
    title: "My Movie CHART",
    imageURLString: "https://image.auction.co.kr/itemimage/20/27/02/2027026666.jpg",
    genre: [Genre(
        genre: "범죄",
        movieTitles: [MovieTitle(
            movieTitle: "범죄도시",
            imageURLString: "https://image.ytn.co.kr/general/jpg/2023/0504/202305041114418543_d.jpg",
            actors: [Actor(actorName: "마동석",
                           nickanme: "마석도",
                           quotes: "어, 아직 싱글이야",
                           imageURLString: "https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/cINm/image/7h8YPD5Wt1Ce_akdBNUxIm7aABs.jpg"),
                     Actor(actorName: "윤계상",
                           nickanme: "장첸",
                           quotes: "니 내 누군지 아니?",
                           imageURLString: "https://i.namu.wiki/i/jSs93TMwz6i0fjDB9bNIAAbXIOLADQl9wWWoEaO7gwTVIJa3Aizrklx8_ddDx4yuUisNAHedJ721GDj1mVQfeRPfqxII82mpBtJlrp5_pA1rkwfN9i3cJUi1se9iCwP75-yS6oX55dCzJIG_kV-f3g.webp")
                 ]
            )]
        ), Genre(
            genre: "멜로/로맨스",
            movieTitles: [MovieTitle(
                movieTitle: "너의 결혼식",
                imageURLString: "https://ojsfile.ohmynews.com/STD_IMG_FILE/2018/0826/IE002383159_STD.jpg",
                actors: [Actor(actorName: "박보영",
                               nickanme: "환승희",
                               quotes: "이 사람이구나 느낌이 오는 시간이 3초래",
                               imageURLString: "https://d3ihz389yobwks.cloudfront.net/1597431301991902226585749700.jpg"),
                         Actor(actorName: "김영광",
                               nickanme: "황우연",
                               quotes: "세상에 반이 여자면 뭐해, 네가 아닌데.",
                               imageURLString: "https://i.namu.wiki/i/Qj-zoQ0vLWuvJuiw4xzS4kDjAYAg1nSw4Mrw4n_AkY5ug0Vl2iSwRQ7YkpvDcW3lmlrKW_6YINzSdkn62Vid566htOAC2ZewS0ryQbf_SmZI1hK7p87Mo7hj7_3ZnhkJubSkt9SLJ7mUwSKW72XWoQ.webp")
                ]
            )]
        )
    ]
)


