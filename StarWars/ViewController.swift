//
//  ViewController.swift
//  StarWars
//
//  Created by Victor Eduardo de Sousa Silva on 14/04/17.
//  Copyright © 2017 O Café Studio. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var vrFilmes:[Filme]!
    var player : AVAudioPlayer?
    
    @IBOutlet weak var vrTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vrFilmes = ParseJSON().buscaDados()
        
        //        let url = Bundle.main.url(forResource: "theme", withExtension: "mp3")!
        //        do {
        //            player = try AVAudioPlayer(contentsOf: url)
        //            guard let player = player else { return }
        //
        //            player.prepareToPlay()
        //            player.play()
        //        } catch let error as NSError {
        //            print(error.description)
        //        }
        
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
        return vrFilmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula") as! Celula
        celula.titleLabel.text = vrFilmes[indexPath.row].title
        celula.releaseDateLabel.text = vrFilmes[indexPath.row].release_date
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    //Metodos de delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ViewControllerDetail") as! ViewControllerDetail
        viewController.move = vrFilmes[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

