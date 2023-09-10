//
//  VideoplayerHelper.swift
//  Africa
//
//  Created by Zeki Baklan on 8.09.2023.
//

import Foundation
import AVKit

var videoPlayer : AVPlayer?

func playVideo(filename : String , fileFormat : String) -> AVPlayer {
    
    if Bundle.main.url(forResource: filename, withExtension: fileFormat) != nil
    {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: filename, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
    
}
