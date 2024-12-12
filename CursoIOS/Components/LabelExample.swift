//
//  LabelExample.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 1/12/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        //Para imagenes normales no iconos
        Label("Hello world", image: "car")
        Label("Hello world", systemImage: "car")
        Label(title: {
            Text("Label")
        }, icon: {Image(systemName: "car")})
    }
}

#Preview {
    LabelExample()
}
