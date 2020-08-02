//
//  EpisodesView.swift
//  Crane
//
//  Created by wangwenjie on 2020/8/1.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI
import Combine


struct Episode {
    var id: Int
    var title: String
}

struct EpisodesView: View {

    @ObservedObject var player: PodcastPlayer
    let episodes: [Episode]
    
    var body: some View {
        List {
            Button(action: {
                if self.player.isPlaying {
                    self.player.pause()
                }else {
                    self.player.play()
                }
            }, label: {
                Text(player.isPlaying ? "pause" : "play")
            })
            
            
        }
    }
    
}


