//
//  PokemonDataManager.swift
//  ExampleMVC
//
//  Created by Osmar Juarez on 27/08/22.
//

import Foundation

class PokemonDataManager{
    private var pokemons : [Pokemon] = []
    
    private func loadData() -> [[String: String]]{
        let decoder = PropertyListDecoder()
        if let path = Bundle.main.path(forResource: "pokemonList", ofType: "plist"),
           let pokemonData = FileManager.default.contents(atPath: path),
           let pokemons = try? decoder.decode([[String: String]].self, from: pokemonData) {
            return pokemons
        }
        return [[:]]
    }
    
    //Count the pokemon size 
    func pokemonCount() -> Int{
        return pokemons.count
    }
    
    //Get Pokemon's info from a specific index in the private array
    func getPokemonAtIndex(index: Int) -> Pokemon{
        return pokemons[index]
    }
    
    
    //Initilize a private array type of Pokemon with the loaded data
    func fetch() {
        for pokemonInfo in loadData(){
            pokemons.append(Pokemon.init(dict: pokemonInfo))
        }
    }
}
