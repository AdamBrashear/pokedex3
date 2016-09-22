//
//  PokemonDetailViewContoller.swift
//  pokedex3
//
//  Created by Damani Turner on 9/19/16.
//  Copyright © 2016 Damani Turner. All rights reserved.
//

import UIKit

class PokemonDetailViewContoller: UIViewController {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var mainImage: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var defenseLabel: UILabel!
  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var pokedexLabel: UILabel!
  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var attackLabel: UILabel!
  @IBOutlet weak var currentEvoImage: UIImageView!
  @IBOutlet weak var nextEvoImage: UIImageView!
  @IBOutlet weak var evoLabel: UILabel!
  
  var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalized
      
        let img = UIImage(named: "\(pokemon.pokedexId)")
      
        mainImage.image = img
        currentEvoImage.image = img
        pokedexLabel.text = "\(pokemon.pokedexId)"
      
        pokemon.downloadPokemonDetail { 
          self.updateUI()
      }
      
    }
  
  func updateUI() {
    attackLabel.text = pokemon.attack
    defenseLabel.text = pokemon.defense
    heightLabel.text = pokemon.height
    weightLabel.text = pokemon.weight
    typeLabel.text = pokemon.type
    descriptionLabel.text = pokemon.description
    
    if pokemon.nextEvolutionId == "" {
      evoLabel.text = "No Evolutions"
      nextEvoImage.isHidden = true
    } else {
      nextEvoImage.isHidden = false
      nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
      let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
      evoLabel.text = str
    }
  }

  
  @IBAction func backButtonPressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
    

  

}
