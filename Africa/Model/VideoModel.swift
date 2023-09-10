//
//  VideoModel.swift
//  Africa
//
//  Created by Zeki Baklan on 8.09.2023.
//

import Foundation

struct Video : Codable , Identifiable {
    
    let id : String
    let name : String
    let headline : String
    // COMPUTED PROPERTY
    var thumbnail : String {
        "video-\(id)"
    }
    
}
