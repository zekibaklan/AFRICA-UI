//
//  ExternalWebView.swift
//  Africa
//
//  Created by Zeki Baklan on 8.09.2023.
//

import SwiftUI

struct ExternalWebView: View {
    
    let animal : Animal
    
    var body: some View {
       
        
        GroupBox {
            HStack {
                
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                
                Group {
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                    Image(systemName: "arrow.up.right.square")
                    
                    
                }
                .foregroundColor(.accentColor)
                
            }//:HSTACK
            
            
        }//:BOX
    }
}

struct ExternalWebView_Previews: PreviewProvider {
    
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
