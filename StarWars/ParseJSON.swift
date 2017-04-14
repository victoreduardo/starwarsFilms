//
//  ParseJSON.swift
//  StarWars
//
//  Created by Victor Eduardo de Sousa Silva on 14/04/17.
//  Copyright © 2017 O Café Studio. All rights reserved.
//

//Bibliotecas utilizadas
import Foundation

//CLASSE UTILIZADA PARA REPRESENTAR O MODELO DE DADOS
class Filme
{
    var producer:String!
    var title:String!
    var opening_crawl:String!
    var director:String!
    var release_date:String!
    var url:String!
}

class ParseJSON {
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
                        filme.title = json["title"] as! String
                        filme.opening_crawl = json["opening_crawl"] as! String
                        filme.director = json["director"] as! String
                        filme.release_date = json["release_date"] as! String
                        filme.producer = json["producer"] as! String
                        filme.url = json["url"] as! String
                        
                        filmes.append(filme)
                    }
                }
            }
        } catch {
            
        }
        return filmes
        
    }
}
