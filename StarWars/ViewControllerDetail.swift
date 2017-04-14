//
//  ViewControllerDetailViewController.swift
//  StarWars
//
//  Created by Victor Eduardo de Sousa Silva on 14/04/17.
//  Copyright © 2017 O Café Studio. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController {
    
    var move: Filme? // Variável declarada como opicional
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var openingCrawlTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*:
         Exibi o NavigationBar
         */
        self.navigationController?.navigationBar.isHidden = false
        self.openingCrawlTextView.isEditable = false
        
        if let m = move {
            titleLabel.text = m.title
            openingCrawlTextView.text = m.opening_crawl
        }
        
    }
    
    
}
