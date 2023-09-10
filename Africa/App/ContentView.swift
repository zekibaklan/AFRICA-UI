//
//  ContentView.swift
//  Africa
//
//  Created by Zeki Baklan on 8.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive : Bool = false
    @State private var gridLayout : [GridItem] = [ GridItem(.flexible())]
    @State private var gridColumn : Int = 1
    @State private var toolbarIcon : String = "square.grid.2x2"
    
    //MARK: - FUNCTIONS
    
    func gridSwitch() {
        
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        //:TOOLBAR IMAGE
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
            
        }
        
        
        
    }
    
    var body: some View {
       
        NavigationView {
            
            
            Group
            {
                if !isGridViewActive {
                    List {
                        
                                    
                                    
                                    
                                    CoverImageView()
                                        .frame(height: 300)
                                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                                        
                                    
                                    ForEach(animals) { animal in
                                        NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                            AnimalListItemView(animal: animal)
                                        }
                                       
                                    }
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }//:LIST
                    
                }
                else {
                    ScrollView(.vertical,showsIndicators: false) {
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                                               
                            }
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn)
                        
                    }//:SCROLL
                }//:CONDITON
            }//:GROUP
            
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //:LIST
                        Button {
                            isGridViewActive = false
                            print("list view has activeted")
                            haptics.impactOccurred()
                            
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        //:GRID
                        
                        Button {
                            isGridViewActive = true
                            print("Grid view has activeted")
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }


                        
                    }//: HSTACK
                    
                }//:BUTONS
                
                    
                
            }
            
            
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
