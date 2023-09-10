//
//  MapAnnotaionView.swift
//  Africa
//
//  Created by Zeki Baklan on 9.09.2023.
//

import SwiftUI

struct MapAnnotaionView: View {
    
    var location : NationalParkLocation
    @State private var animation : Double = 0.0
    
    
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48)
            .clipShape(Circle())
            
        }//:ZSTACK
        .onAppear {
            
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
        
    }
}

struct MapAnnotaionView_Previews: PreviewProvider {
    static var location : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    
    static var previews: some View {
        MapAnnotaionView(location: location[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
