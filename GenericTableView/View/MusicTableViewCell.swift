//
//  MusicTableViewCell.swift
//  MVVM_MusicAPI
//
//  Created by Anurag Kashyap on 02/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell, ConfigurableCellProtocol {
    
    typealias T = MusicVM

    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
   
    func configureCell(with item: MusicTableViewCell.T, at indexpath: IndexPath) {
        self.artistName.text = item.artistName
        self.trackName.text = item.trackName
        self.musicImageView.imageFromURL(urlString: (item.imageUrl))
    }
}
