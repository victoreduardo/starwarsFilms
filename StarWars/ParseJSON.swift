//
//  ParseJSON.swift
//  StarWars
//
//  Created by Victor Eduardo de Sousa Silva on 14/04/17.
//  Copyright © 2017 O Café Studio. All rights reserved.
//

//Bibliotecas utilizadas
import Foundation

class ParseJSON {
    
    func buscaDadosCaracters()->[Person]{

        var people = [Person]()
        
        do {
            let caminho = URL(string: "http://swapi.co/api/people/?format=json")
            
            let dados = try Data(contentsOf: caminho!)
            if dados.count > 0 {
                let parsedData = try JSONSerialization.jsonObject(with: dados as Data, options: .allowFragments)
                let dict = parsedData as? NSDictionary
                
                
                let arrayFilmes = try dict?["results"] as? Array<Any>
                
                if let vetorFilmes = arrayFilmes {
                    for json in vetorFilmes {
                        let json = json as! NSDictionary
                        
                        let item = Person()
                        item.name = json["name"] as! String
                        item.height = json["height"] as! String
                        item.mass = json["mass"] as! String
                        item.hair_color = json["hair_color"] as! String
                        item.skin_color = json["skin_color"] as! String
                        item.eye_color = json["eye_color"] as! String
                        item.birth_year = json["birth_year"] as! String
                        item.gender = json["gender"] as! String
                        item.url = json["url"] as! String
                        
                        people.append(item)
                    }
                }
            }
        } catch {
            
        }
        return people
    }
    
    func buscaDados()->[Filme]
    {
        var filmes = [Filme]()
        
        do {
            let caminho = URL(string: "http://swapi.co/api/films/?format=json")
            
            let dados = try Data(contentsOf: caminho!)
            if dados.count > 0 {
                let parsedData = try JSONSerialization.jsonObject(with: dados as Data, options: .allowFragments)
                let dict = parsedData as? NSDictionary
                
                
                let arrayFilmes = try dict?["results"] as? Array<Any>
                
                if let vetorFilmes = arrayFilmes {
                    for json in vetorFilmes {
                        let json = json as! NSDictionary
                        
                        let filme = Filme()
                        filme.caracters = [String]()
                        filme.title = json["title"] as! String
                        filme.opening_crawl = json["opening_crawl"] as! String
                        filme.director = json["director"] as! String
                        filme.release_date = json["release_date"] as! String
                        filme.producer = json["producer"] as! String
                        filme.url = json["url"] as! String
                        
                        
                        let categories = json["characters"] as! [String]
                        
                        for carac in categories {
                            
                            filme.caracters.append(carac as! String)
                            
                        }
                        
                        filmes.append(filme)
                    }
                }
            }
        } catch {
            
        }
        return filmes
        
    }
}
