//
//  DataModel.swift
//  TennisScoresTableViewWithStackView
//
//  Created by Bart van Kuik on 19/09/2018.
//  Copyright © 2018 DutchVirtual. All rights reserved.
//

import Foundation

struct Tournament {
    let name: String
    let contests: [Contest]
}

struct Contest {
    let name: String
    let results: [Result]
}

struct Result {
    let name: String
    let scores: [Int]
}

struct Match {
    let player1: [Result]
    let player2: [Result]
}

let globalTournament = Tournament(name: "Wimbledon", contests: [
    Contest(name: "Men's singles", results: [
        Result(name: "J. Del Potro", scores: [3,6,3]),
        Result(name: "N. Djokovic", scores: [6,7,6])
        ]),
    Contest(name: "Women's singles", results: [
        Result(name: "N. Osaka", scores: [6,6]),
        Result(name: "S. Williams", scores: [2,4])
        ])
    ])
