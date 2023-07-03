//
//  PokemonData.swift
//  iOS_034_ByeonSangwoo
//
//  Created by 변상우 on 2023/07/02.
//

import Foundation
import SwiftUI

struct Pokemon {
    var team: String
    var name: String
    var attribute: String
    var image: Image
}

let jiwooTeam = [
    Pokemon(team: "Jiwoo", name: "파이리", attribute: "fire", image: Image("파이리")),
    Pokemon(team: "Jiwoo", name: "꼬부기", attribute: "water", image: Image("꼬부기")),
    Pokemon(team: "Jiwoo", name: "이상해씨", attribute: "grass", image: Image("이상해씨")),
]

let rocketDanTeam = [
    Pokemon(team: "RocketDan", name: "파이어", attribute:"fire", image: Image("파이어")),
    Pokemon(team: "RocketDan", name: "마자용", attribute: "water", image: Image("마자용")),
    Pokemon(team: "RocketDan", name: "모다피", attribute: "grass", image: Image("모다피")),
]
