//
//  Service.swift
//  MVVM_MusicAPI
//
//  Created by Anurag Kashyap on 02/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let sharedInstance = Service()
    func getMusicData(onSuccess: @escaping([MusicModel]?, Error?)->Void){
        let url = URL(string: musicApiUrl)!
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            guard error == nil, let dataValue = data else {onSuccess(nil, error); return} //Error
            let musicData = try? JSONDecoder().decode(MusicResponse.self, from: dataValue)
            guard let musicDataArray = musicData?.results else {return}
            onSuccess(musicDataArray, nil) // Success
        }.resume()
    }
}
