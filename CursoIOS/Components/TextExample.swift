//
//  TextExample.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 1/12/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
            Text("Custom").font(.system(
                size: 40,
                weight: .light,
                design: .rounded
            ))
            .italic()
            .bold()
            .underline()
            .foregroundColor(.blue)
            .background(.red)
            Text("JAJJAJ AJAJJAJ AJA JAJAJA JAJ").frame(width: 50).lineLimit(3).lineSpacing(10)
        }
    }
}

#Preview {
    TextExample()
}
