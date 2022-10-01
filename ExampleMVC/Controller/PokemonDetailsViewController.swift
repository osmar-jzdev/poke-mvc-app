//
//  PokemonDetailsController.swift
//  ExampleMVC
//
//  Created by Osmar Juarez on 27/08/22.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    var receivedPokemon: Pokemon?
    
    @IBOutlet var pokeTitle: UILabel!
    
    @IBOutlet var pokeImageSelected: UIImageView!
    
    @IBOutlet var pokeMove: UILabel!
    
    @IBOutlet var pokeAbility: UILabel!
    
    @IBOutlet var pokeWeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillPokeDetails()
    }
    
    @IBAction func backButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    private func fillPokeDetails(){
        pokeTitle.text = receivedPokemon?.name
        pokeImageSelected.image = UIImage.init(named: receivedPokemon!.image)
        pokeMove.text = "Move: " + receivedPokemon!.move
        pokeAbility.text = "Ability: " +  receivedPokemon!.ability
        pokeWeight.text = "Weght: " +  receivedPokemon!.weight
    }
}
