//
//  InsetFactView.swift
//  Africa
//
//  Created by Zeki Baklan on 8.09.2023.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - PROPERTY
    
    let animal : Animal
    
    
    
    
    //MARK: - BODY
    
    
    
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//:TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148 , idealHeight: 168 , maxHeight: 180)
            
            
            
        }//:BOX
    }
}






//MARK: - PREVIEW
struct InsetFactView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
     static var previews: some View {
         InsetFactView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
