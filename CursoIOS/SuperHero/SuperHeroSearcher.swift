//
//  SuperHeroSearcher.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 4/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {
   
    @State var superheroName:String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
    var body: some View {
        VStack{
            TextField("", text: $superheroName,prompt:
                        Text("Superman...").font(.title2).bold().foregroundStyle(.gray))
            .foregroundStyle(.white)
            .padding(16)
            .border(.purple, width: 1.5 )
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                loading = true
                print(superheroName)
                Task{
                    do{
                        wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                    }catch{
                        print("error")
                    }
                    loading = false;
                }
                
            }
            if(loading){
                ProgressView().tint(.white)
            }
            NavigationStack{
                List(wrapper?.results ?? []){ superhero in
                    ZStack{
                        SuperHeroItem(superhero: superhero)
                        NavigationLink(destination:SuperheroDetail(id: superhero.id)){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

struct SuperHeroItem:View{
    let superhero:ApiNetwork.SuperHero
    var body: some View{
        ZStack{
            WebImage(url: URL(string: superhero.image.url)).resizable().indicator(.activity).scaledToFill().frame(height: 200)
            VStack{
                Spacer()
                Text(superhero.name).foregroundStyle(.white).font(.title).bold().padding().frame(maxWidth: .infinity).background(.white.opacity(0.25))
            }
        }.frame(height: 200).cornerRadius(32)
        
    }
}

#Preview {
    SuperHeroSearcher()
}
