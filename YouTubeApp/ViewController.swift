//
//  ViewController.swift
//  YouTubeApp
//
//  Created by Alisa Koprić on 27/11/16.
//  Copyright © 2016 Alisa Koprić. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var videos: [Video] = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.videos = VideoModel().getFeedVideos()
        
    }

}

