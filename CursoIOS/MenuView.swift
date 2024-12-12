//
//  MenuView.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 1/12/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List{
                NavigationLink(destination:IMCView()) {
                    Text("IMC Calculator")
                }
                NavigationLink(destination: SuperHeroSearcher()){
                    Text("SuperHero Finder")
                }
                
                NavigationLink(destination: MapView()){
                    Text("Map view")
                }

                Text("App 4")
            }
        }
    }
}

#Preview {
    MenuView()
}
