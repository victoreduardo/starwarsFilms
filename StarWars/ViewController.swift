//
//  ViewController.swift
//  StarWars
//
//  Created by Victor Eduardo de Sousa Silva on 14/04/17.
//  Copyright © 2017 O Café Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var vrFilmes:[Filme]!

    @IBOutlet weak var vrTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vrFilmes = ParseJSON().buscaDados()
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
        return vrFilmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula") as! Celula
        celula.vrTitle.text = vrFilmes[indexPath.row].title
        celula.vrOpening_crawl.text = vrFilmes[indexPath.row].opening_crawl
        celula.vrDirector.text = String(vrFilmes[indexPath.row].director)
        
        return celula
    }
    
    //Metodos de delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
    //Implementacao do metodo chamado para a troca de tela
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let indexPath = vrTableView.indexPathForSelectedRow
        {
            let telaProduto = segue.destination as! ViewControllerDetail
            telaProduto.titulo = cardapio[indexPath.section]
            telaProduto.nome = itensCardapio[indexPath.section][indexPath.row]
            telaProduto.imagem = UIImage(named: itensCardapio[indexPath.section][indexPath.row])
        }
    }


}

