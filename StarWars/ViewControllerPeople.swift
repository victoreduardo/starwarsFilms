//
//  ViewControllerPeople.swift
//  StarWars
//
//  Created by Victor Eduardo de Sousa Silva on 14/04/17.
//  Copyright © 2017 O Café Studio. All rights reserved.
//

import UIKit

class ViewControllerPeople: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var vrTableView: UITableView!
    
    var vrPeople:[Person]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vrPeople = ParseJSON().buscaDadosCaracters()
        print("total de pessoas \(vrPeople.count)")
        
        vrTableView.delegate = self
        vrTableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /*:
        Esconde o NavigationBar
        */
        self.navigationController?.navigationBar.isHidden = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Metodos de datasource
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return vrPeople.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaPerson") as! CelulaPerson
        celula.vrName.text = vrPeople[indexPath.row].name
//        celula.vrGender.text = vrPeople[indexPath.row].gender
        
        return celula
    }
    
    //Metodos de delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
}
