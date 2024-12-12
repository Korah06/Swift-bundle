//
//  ButtonExample.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 1/12/24.
//

import SwiftUI

//Basic button
struct ButtonExample: View {
    var body: some View {
        Button("Hola") {
            print("HELLO")
        }
    }
}

struct Counter: View{
    @State var counterNumber: Int = 0
    var body: some View {
        Button (action:{
            counterNumber += 1
        }, label: {
            Text("Counter: \(counterNumber)")
                .padding(20)
                .font(.title)
                .bold()
                .frame( height: 50)
                .background(.blue)
                .foregroundStyle(.white)
                .cornerRadius(10)
        })
    }
}

#Preview {
    Counter()
}
