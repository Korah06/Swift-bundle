//
//  IMCView.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 1/12/24.
//

import SwiftUI

struct IMCView: View {
    //Change title navigation bar color
    //init() {
    //    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    //}
    
    @State var gender:Int = 0
    @State var height:Double = 170
    @State var age:Int = 18
    @State var weight:Int = 70
    
    var body: some View {
        VStack{
            HStack {
                ToggleButton(text: "Hombre", imgName: "car", index: 0,selectedIndex: $gender)
                ToggleButton(text: "Mujer", imgName: "figure.barre", index: 1,selectedIndex: $gender)
            }
            HeightCalculator(height: $height)
            HStack{
                CounterButton(text:"Edad",counter: $age)
                CounterButton(text:"Peso",counter: $weight)
            }
            CalculateButton(
                userWeight: weight,
                userHeight: Int(height)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            //.navigationTitle("IMC Calculator")
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("IMC Calculator")
                        .bold()
                        .foregroundStyle(.white)
                }
            }
    }
}

struct ToggleButton:View {
    let text:String
    let imgName:String
    let index:Int
    @Binding var selectedIndex:Int
    
    
    
    var body: some View {
        let color = if (selectedIndex == index){
            Color.backgroundComponentSelected
        } else{
            Color.backgroundComponent
        }
        
        Button (action:{
            selectedIndex = index
        }){
            VStack{
                Image(systemName: imgName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundStyle(.white)
                InformationText(text: text)
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(color)
        }

    }
}

struct InformationText:View {
    let text:String
    var body: some View {
        Text("\(text)")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
    }
}

struct titleText:View {
    let text:String
    var body: some View {
        Text("\(text)")
            .font(.title2)
            .foregroundStyle(.gray)
    }
}

struct HeightCalculator:View {
    @Binding var height:Double
    var body: some View {
        VStack{
            titleText(text: "Altura")
            InformationText(text: "\(Int(height)) cm")
            Slider(value: $height,in: 100...220, step:1)
                .tint(.purple)
                .padding(.horizontal, 16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct CounterButton:View {
    var text:String
    @Binding var counter:Int
    var body: some View {
        VStack{
            titleText(text: "\(text)")
            InformationText(text: "\(counter)")
            HStack{
                Button(action: {if counter < 100{counter+=1}}){
                    ZStack{
                        Circle()
                            .frame(width: 70,height: 70)
                            .foregroundStyle(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .frame(width: 25,height: 25)
                    }
                }
                
                Button(action: {if(counter > 0){counter-=1}}){
                    ZStack{
                        Circle()
                            .frame(width: 70,height: 70)
                            .foregroundStyle(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .frame(width: 25,height: 25)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct CalculateButton:View {
    let userWeight: Int
    let userHeight: Int
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: {
                IMCResult(
                    userWeight: userWeight,
                    userHeight: userHeight
                )
            }){
                Text("Calcular")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(.backgroundComponent)
            }
        }
    }
}

#Preview {
    IMCView()
}
