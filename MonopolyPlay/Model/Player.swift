//
//  Player.swift
//  MonopolyPlay
//
//  Created by Балауса Косжанова on 19.02.2023.
//

import Foundation

struct Player {
    let name: String
    var wallet: Int
    var position: Int
    var myPlace: [String]
    
    init(name: String, wallet: Int, position: Int, myPlace: [String]) {
        self.name = name
        self.wallet = wallet
        self.position = position
        self.myPlace = myPlace
    }
}
