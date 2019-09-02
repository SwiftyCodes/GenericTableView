//
//  MusicVM.swift
//  GenericTableView
//
//  Created by Anurag Kashyap on 02/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

import UIKit

class MusicVM: NSObject {
    
    var artistName : String
    var trackName : String
    var soundPreview : String
    var imageUrl : String
    
    init(music : MusicModel) {
        self.artistName = music.artistName
        self.trackName = music.trackName
        self.soundPreview = music.soundPreview
        self.imageUrl = music.imageUrl
    }
}
