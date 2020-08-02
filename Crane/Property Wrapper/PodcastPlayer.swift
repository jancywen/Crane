//
//  PodcastPlayer.swift
//  Crane
//
//  Created by wangwenjie on 2020/8/1.
//  Copyright © 2020 captain. All rights reserved.
//

import Combine

final class PodcastPlayer: ObservableObject {
    @Published private(set) var isPlaying = false
    
    func play() {
        isPlaying = true
    }
    
    func pause() {
        isPlaying = false
    }
    
}
