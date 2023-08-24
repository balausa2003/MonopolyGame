//
//  AllPlayers.swift
//  MonopolyPlay
//
//  Created by Балауса Косжанова on 19.02.2023.
//

import Foundation
 
struct AllPlayers {
    var players = [
        Player(name: "Player1" , wallet: 200_000, position: 0, myPlace:[]),
        Player(name: "Player2", wallet: 200_000, position: 0, myPlace:[])
    ]
    func gettingPosition1() -> Int {
        return players[0].position
    }
    func gettingPosition2() -> Int {
        return players[1].position
    }
}
