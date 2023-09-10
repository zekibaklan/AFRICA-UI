//
//  CenterModifier.swift
//  Africa
//
//  Created by Zeki Baklan on 9.09.2023.
//

import SwiftUI

struct CenterModifier : ViewModifier  {
    
    func body(content : Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
            
        }
        
    }
    
}
