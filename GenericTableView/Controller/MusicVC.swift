//
//  ViewController.swift
//  GenericTableView
//
//  Created by Anurag Kashyap on 02/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class MusicVC : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var musicVMArray : [MusicVM] = []
    var provider : ArrayDataAdapter<MusicVM> {
        return ArrayDataAdapter<MusicVM>(genericData: musicVMArray)
    }
    //Here MusicVM is passed in ArrayDataAdapter because our Array is of type MusicVM.
    fileprivate var dataSource  : TableViewDataSource<ArrayDataAdapter<MusicVM>, MusicTableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    func setUpTableView() {
        Service.sharedInstance.getMusicData { (music, error) in
            if error != nil {
                print(error!)
            }else{
                self.musicVMArray = music?.map({return MusicVM(music: $0) }) ?? []
                DispatchQueue.main.async {
                    self.dataSource = TableViewDataSource<ArrayDataAdapter<MusicVM>, MusicTableViewCell>(tableView: self.tableView, provider: self.provider)
                }
            }
        }
    }
}
