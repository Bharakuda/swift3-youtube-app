//
//  VideoModel.swift - Responsible for supplying video objects to the UIViewController
//                        UIViewController is communicating with VideoModel to get the data
//  YouTubeApp
//
//  Created by Alisa Koprić on 27/11/16.
//  Copyright © 2016 Alisa Koprić. All rights reserved.
//

import UIKit

class VideoModel: NSObject {
    
    // Method for UIViewController to call
    func getFeedVideos() -> [Video] {
        
        var videos = [Video]()
        
        // Create a video object
        let video1 = Video()
        
        // Assign properties
        video1.videoId = "some video id"
        video1.videoTitle = "some title"
        video1.videoDescription = "some description"
        video1.videoThumbnail = "some thumbnail"
        
        // Append it into the videos array
        videos.append(video1)
    
        return videos
    }

}
