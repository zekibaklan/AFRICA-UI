//
//  MapView.swift
//  Africa
//
//  Created by Zeki Baklan on 8.09.2023.
//

import SwiftUI
import MapKit


struct MapView: View {
    
    @State private var region : MKCoordinateRegion = {
        var mapCordinaates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCordinaates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let location : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        
        //MARK: - 1.BASIC MAP
//        Map(coordinateRegion: $region)
        //MARK: - 2. ADVANCED MAP
        
        Map(coordinateRegion: $region, annotationItems: location , annotationContent:
        { item in
            // (A) PIN : OLD STYLE (always static)
            //MapPin(coordinate: item.location,tint: .accentColor)
            // (B) PIN : NEW STYLE (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            // (C) PIN : CUSTOM STYLE (it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32 ,alignment: .center)
//
//
//
//            }
            // (D) PIN : COMPLEX MAP ANNOTATION (it could be interactive)
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotaionView(location: item)
            }
            
            
        }) //:MAP
        
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3)
                {
                    HStack {
                        Text("Latitude : ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                                        Divider()
                    HStack {
                        Text("Longitude : ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }

                }
            }//:HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal,16)
                .background(
                    
                    Color.black
                    .cornerRadius(8)
                    .opacity(0.6))
                .padding()
            ,alignment: .top
            
            
        )
        
     
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
