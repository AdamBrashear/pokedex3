//
//  PokeCell.swift
//  pokedex3
//
//  Created by Damani Turner on 9/18/16.
//  Copyright © 2016 Damani Turner. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
  @IBOutlet weak var thumbImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  var pokemon: Pokemon!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    layer.cornerRadius = 5.0
  }
  
  func configureCell(_ pokemon: Pokemon) {
    
    self.pokemon = pokemon
    
    nameLabel.text = self.pokemon.name.capitalized
    thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
  }
}
