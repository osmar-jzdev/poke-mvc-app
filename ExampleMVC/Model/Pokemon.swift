//
//  Pokemon.swift
//  ExampleMVC
//
//  Created by Osmar Juarez on 26/08/22.
//

import Foundation

struct Pokemon{
    let name: String
    let move: String
    let ability: String
    let weight: String
    let image: String
}

extension Pokemon{
    init(dict: [String: String]){
        self.name = dict["name"]!
        self.move = dict["move"]!
        self.ability = dict["ability"]!
        self.weight = dict["weight"]!
        self.image = dict["image"]!
    }
}
