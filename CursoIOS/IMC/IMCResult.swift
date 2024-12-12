//
//  IMCResult.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 1/12/24.
//

import SwiftUI

struct IMCResult: View {
    let userWeight: Int
    let userHeight: Int
    var body: some View {
        VStack{
            Text("Tu resultado")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
            InformationView(
                result: calculateIMC(
                    weight: Double(userWeight),
                    height: Double(userHeight)
                ))
        }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundApp)
    }
}

func calculateIMC(weight:Double,height:Double)->Double{
    return weight/(height/100*height/100)
}

struct InformationView:View {
    let result:Double
    var body: some View {
        VStack{
            Text("\(result)")
                .font(.title)
                .bold()
                .foregroundStyle(.green)
        }
    }
}

#Preview {
    IMCResult(userWeight: 80, userHeight: 190)
}
