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
        model.getFeedVideos()
        
        // Assign the UIViewController as the UITableView datasource
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - VideoModelDelegate Methods
    func dataReady() {
        // Access the video objects that have been downloaded
        self.videos = self.model.videoArray
        
        // Tell the TableView to reload
        self.tableView.reloadData()
    }
    
    // MARK: - TableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    // UITableView calls this method when it wants to display a cell in the scrollable list(table view), it is being called for every single cell that is going to be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // method tries to get a cell with reusable identifier "BasicCell"-> thats our Prototype Cell
        // constant cell references UITableView Cell object
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        
        // Customize the cell to display the video title
        cell.textLabel?.text = videos[indexPath.row].videoTitle
        
        //Get the label for the cell
        //let label = cell.viewWithTag(2) as! UILabel
        //label.text = videos[indexPath.row].videoTitle
        
        return cell
    }

}
