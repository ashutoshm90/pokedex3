//
//  PokemonDetailVC.swift
//  PokeDex
//
//  Created by Ashutosh on 29/06/17.
//  Copyright © 2017 Cini Labs. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    var pokemon: Pokemon!
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var evolLbl: UILabel!
  
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var desciprionLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(pokemon.name)
        self.name.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img;
        currentEvoImg.image = img;
        pokedexIdLbl.text = "\(pokemon.pokedexId)";
        
        
        pokemon.downloadPokemonDetail {
            self.updateUI()
        }
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        typeLbl.text = pokemon.type
        desciprionLbl.text = pokemon.description
        
        if pokemon.nextevolutionId == "" {
            evolLbl.text = "No Evolution"
            nextEvoImg.isHidden = true
        }else{
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextevolutionId)
            let string = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLvl)"
            evolLbl.text = string
        }
            
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
