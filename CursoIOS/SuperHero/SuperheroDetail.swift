//
//  SuperheroDetail.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 10/12/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    let id:String
    @State var superHero:ApiNetwork.DetailSuperHero? = nil
    @State var loading:Bool = true
    var body: some View {
        VStack{
            if loading{
                ProgressView().tint(.white)
            } else if let superHero = superHero{
                WebImage(url: URL(string:superHero.image.url)).resizable().scaledToFill().frame(height: 250).clipped()
                Text(superHero.name).bold().font(.title).foregroundStyle(.white)
                ForEach(superHero.biography.aliases, id:\.self){ alias in
                    Text(alias).foregroundStyle(.gray).italic()
                }
                SuperHeroStats(stats: superHero.powerstats)
                Spacer()
            }
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundApp).onAppear{
            Task{
                do{
                    superHero = try await ApiNetwork().getHeroById(id:id)
                }catch{
                    superHero = nil
                }
                loading = false
            }
        }
    }
}

struct SuperHeroStats:View {
    let stats:ApiNetwork.PowerStats
    var body: some View{
        VStack{
            Chart{
                SectorMark(angle:.value("Count",Int(stats.combat) ?? 0), innerRadius: .ratio(0.5), angularInset: 5).cornerRadius(50).foregroundStyle(by: .value("Category", "Combate"))
                SectorMark(angle:.value("Count",Int(stats.durability) ?? 0), innerRadius: .ratio(0.5), angularInset: 5).cornerRadius(50).foregroundStyle(by: .value("Category", "Durabilidad"))
                SectorMark(angle:.value("Count",Int(stats.intelligence) ?? 0), innerRadius: .ratio(0.5), angularInset: 5).cornerRadius(50).foregroundStyle(by: .value("Category", "Inteligencia"))
                SectorMark(angle:.value("Count",Int(stats.power) ?? 0), innerRadius: .ratio(0.5), angularInset: 5).cornerRadius(50).foregroundStyle(by: .value("Category", "Poder"))
                SectorMark(angle:.value("Count",Int(stats.speed) ?? 0), innerRadius: .ratio(0.5), angularInset: 5).cornerRadius(50).foregroundStyle(by: .value("Category", "Velocidad"))
                SectorMark(angle:.value("Count",Int(stats.strength) ?? 0), innerRadius: .ratio(0.5), angularInset: 5).cornerRadius(50).foregroundStyle(by: .value("Category", "Fuerza"))
            }
        }.padding(16).frame(maxWidth: .infinity,maxHeight: 350).background(.white).cornerRadius(16).padding(24)
    }
}

#Preview {
    SuperheroDetail(id: "1")
}
