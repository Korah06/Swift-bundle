//
//  ApiNetwork.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 4/12/24.
//

import Foundation

class ApiNetwork {
    
    struct Wrapper:Codable{
        let response:String
        let results:[SuperHero]
    }
    
    struct SuperHero:Codable, Identifiable{
        let id:String
        let name:String
        let image:ImageSuperHero
    }
    
    struct DetailSuperHero: Codable{
        let id:String
        let name:String
        let image:ImageSuperHero
        let powerstats:PowerStats
        let biography:Biography
    }
    
    struct PowerStats: Codable{
        let intelligence:String
        let strength:String
        let speed:String
        let durability:String
        let power:String
        let combat:String
    }
    
    struct Biography: Codable{
        let alignment:String
        let publisher:String
        let aliases:[String]
        let fullName:String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full-name"
            case publisher = "publisher"
            case alignment = "alignment"
            case aliases = "aliases"
        }
    }
    
    struct ImageSuperHero: Codable{
        let url:String
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper{
        let url: URL = URL(string:"https://superheroapi.com/api/2254623a8a82f6cd0ab04f25019c76d7/search/\(query)")!
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let wrapper:Wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper        
    }
    
    func getHeroById(id:String) async throws -> DetailSuperHero{
        let url = URL(string: "https://superheroapi.com/api/2254623a8a82f6cd0ab04f25019c76d7/\(id)")!
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let superHero:DetailSuperHero = try JSONDecoder().decode(DetailSuperHero.self, from: data)
        return superHero
        
    }
}
