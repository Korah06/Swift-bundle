//
//  MapView.swift
//  CursoIOS
//
//  Created by Mario Espasa Planells on 10/12/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 100, longitude: 100), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.3))
    )
    var body: some View {
        ZStack{
            MapReader{ proxy in
                Map(position: $position).mapStyle(.hybrid(elevation: .realistic, showsTraffic: true)).onMapCameraChange(frequency: .onEnd) { context in
                    print("Entamos en: \(context.region)")
                }.onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local){
                        
                    }
                }
            }
            VStack{
                Spacer()
                HStack{
                    Button("Ir a America"){
                        withAnimation{
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 500, longitude: 800), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.3)))
                        }
                    }.padding(32).background(.white).padding(10)
                    Button("Ir a Europa"){
                        withAnimation{
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 200, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.3)))
                        }
                    }.padding(32).background(.white).padding(10)
                }
            }
        }
        
    }
}

#Preview {
    MapView()
}
