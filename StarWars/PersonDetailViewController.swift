//
//  PersonDetailViewController.swift
//  StarWars
//
//  Created by Tito Albino Evangelista da Silva Junior on 14/04/17.
//  Copyright © 2017 O Café Studio. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    var person: Person? // Variável declarada como opicional
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hair_colorLabel: UILabel!
    @IBOutlet weak var skin_colorLabel: UILabel!
    @IBOutlet weak var eye_colorLabel: UILabel!
    @IBOutlet weak var birth_yearl: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*:
         Exibi o NavigationBar
         */
        self.navigationController?.navigationBar.isHidden = false
        
        if let p = person {
            nameLabel.text = p.name
            heightLabel.text = p.height
            massLabel.text = p.mass
            hair_colorLabel.text = p.hair_color
            skin_colorLabel.text = p.skin_color
            eye_colorLabel.text = p.eye_color
            birth_yearl.text = p.birth_year
            gender.text = p.gender
        }
        
    }
}
