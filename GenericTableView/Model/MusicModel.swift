//
//  MusicModel.swift
//  GenericTableView
//
//  Created by Anurag Kashyap on 02/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

class MusicModel: Decodable {
    
    var artistName : String
    var trackName : String
    var soundPreview : String
    var imageUrl : String
    
    private enum CodingKeys : String, CodingKey {
        case artistName
        case trackName
        case soundPreview = "previewUrl"
        case imageUrl = "artworkUrl100"
    }
    
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.artistName = try container.decode(String.self, forKey: .artistName)
        self.trackName = try container.decode(String.self, forKey: .trackName)
        self.soundPreview = try container.decode(String.self, forKey: .soundPreview)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
}

class MusicResponse: Decodable {
    var results : [MusicModel]
}
