//
//  VideoModel.swift - Responsible for supplying video objects to the UIViewController
//                        UIViewController is communicating with VideoModel to get the data
//  YouTubeApp
//
//  Created by Alisa Koprić on 27/11/16.
//  Copyright © 2016 Alisa Koprić. All rights reserved.
//

import UIKit
import Alamofire

protocol VideoModelDelegate {
    func dataReady()
}

class VideoModel: NSObject {
    var delegate: VideoModelDelegate?
    var videosArray = [Video]()
    let parameters: Parameters = [
        "part": "snippet",
        "playlistId": "PLpZBns8dFbgyCJ-ftS7inE9AYEdorFt_Q",
        "key": "AIzaSyCzH2l_e_-tEeGHby2XGwsOHmJVA0S_U9Q"
    ]
    
    func getFeedVideos() {
        
        Alamofire.request("http://www.googleapis.com/youtube/v3/playlistItems", parameters: parameters).responseJSON { (response) in
            
            if let JSON = response.result.value as? [String: Any] {
                var arrayOfVideos = [Video]()
                
                if let items = JSON["items"] as? [[String: Any]] {
                    for video in items {
                        
                        // Create video objects off the JSON response
                        let videoObj = Video()
                        
                        videoObj.videoId = (video as NSDictionary).value(forKeyPath: "snippet.resourceId.videoId") as! String
                        videoObj.videoTitle = (video as NSDictionary).value(forKeyPath: "snippet.title") as! String
                        
                        arrayOfVideos.append(videoObj)
                        print(videoObj)
                    }
                }
                self.videosArray = arrayOfVideos
            }
        }
        
        if self.delegate != nil {
            self.delegate!.dataReady()
        }
    }

}
