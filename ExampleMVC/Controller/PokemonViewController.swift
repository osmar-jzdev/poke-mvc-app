//
//  PokemonViewController.swift
//  ExampleMVC
//
//  Created by Osmar Juarez on 27/08/22.
//

import UIKit

class PokemonViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var pokemons: [Pokemon] = []
    
    var selectedPokemon: Pokemon?
    
    let manager = PokemonDataManager()
    
    @IBOutlet var PokemonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.fetch()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.pokemonCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as! PokeCell
        let pokemon = manager.getPokemonAtIndex(index: indexPath.row)
        cell.pokeImageView.image =  UIImage.init(named: pokemon.image)
        cell.pokemonLabel.text = pokemon.name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPokemon =  manager.getPokemonAtIndex(index: indexPath.row)
        self.performSegue(withIdentifier: "PokemonDetailsSegue", sender: Self.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PokemonDetailsViewController
        destination.receivedPokemon = selectedPokemon
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "pokeHeader", for: indexPath) as! PokeHeader
        header.imgPokeHeader.image = UIImage.init(named: "header.jpg")
            return header
        }
}
