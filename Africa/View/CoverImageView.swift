//
//  CoverImageView.swift
//  Africa
//
//  Created by Zeki Baklan on 8.09.2023.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - PROPORTIES
    
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    //MARK: - BODY
    
    
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable().scaledToFill()
            }
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}
//MARK: PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
