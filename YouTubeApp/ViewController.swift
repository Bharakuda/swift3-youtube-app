//
//  ViewController.swift is the UITableView DataSource, UIViewController needs to follow a specific protocol which dictates what sorts of methods it needs to have in order to be a datasource for the UITableView. Same thing goes for the delegate
//  YouTubeApp
//
//  Created by Alisa Koprić on 27/11/16.
//  Copyright © 2016 Alisa Koprić. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, VideoModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    var videos: [Video] = [Video]()
    var model: VideoModel = VideoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model.delegate = self
        
        // Fire off request to get videos
        self.model.getFeedVideos()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    // MARK: - VideoModelDelegate Methods
    func dataReady() {
        // Access the video objects that have been downloaded
        self.videos = self.model.videosArray
        self.tableView.reloadData()
    }
    
    // MARK: - TableViewDelegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        cell.textLabel?.text = self.videos[indexPath.row].videoTitle
        
        return cell
    }

}
