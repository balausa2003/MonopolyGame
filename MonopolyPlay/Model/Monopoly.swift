//
//  Monopoly.swift
//  MonopolyPlay
//
//  Created by Балауса Косжанова on 19.02.2023.
//

import Foundation

struct Monopoly {
    let name: String
    let price: Int
    let place: Int
    
    init(name: String, price: Int, place: Int) {
        self.name = name
        self.price = price
        self.place = place
    }
}
