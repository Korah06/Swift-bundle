//
//  ListExample.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 3/12/24.
//

import SwiftUI

struct ListExample: View {
    
    var pokemons: [Pokemon] = [
        Pokemon(name: "Pikachu"),
        Pokemon(name: "Charmander"),
        Pokemon(name: "Squirtle"),
        Pokemon(name: "Bulbasaur"),
        Pokemon(name: "Mewtwo"),
        Pokemon(name: "Mew"),
    ]
    
    
    var digimons: [Digimon] = [
        Digimon(name: "Digimon"),
        Digimon(name: "Digimon"),
        Digimon(name: "Digimon"),
        Digimon(name: "Digimon"),
    ]
    
    
    var body: some View {
        //List{
        //Text("Hello, World!")
        //Text("Hello, World!")
        //Text("Hello, World!")
        //}
//        List{
//            ForEach(pokemons, id:\.name){ pokemon in
//                Text(pokemon.name)
//            }
//        }
//        List(digimons){digimon in
//            Text(digimon.name)
//        }
        List{
            Section(header: Text("Pokemons")){
                ForEach(pokemons, id:\.name){ pokemon in
                    Text(pokemon.name)
                }
            }
            Section(header: Text("Digimons")){
                ForEach(digimons){digimon in
                    Text(digimon.name)
                }
            }
        }
        
        
    }
}

struct Pokemon{
    let name: String
}

//With the identifiable permits not put the id manually on the foreach or the list
struct Digimon: Identifiable{
    var id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
