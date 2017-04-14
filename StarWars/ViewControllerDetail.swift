//
//  ViewControllerDetailViewController.swift
//  StarWars
//
//  Created by Victor Eduardo de Sousa Silva on 14/04/17.
//  Copyright © 2017 O Café Studio. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*:
            Exibi o NavigationBar
         */
       self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        /*:
         Esconde o NavigationBar
         */
         self.navigationController?.navigationBar.isHidden = false
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
