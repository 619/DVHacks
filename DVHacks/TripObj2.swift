//
//  Post.swift
//  DVHacks
//
//  Created by Bobby Zhang on 2018-04-14.
//  Copyright © 2018 com. All rights reserved.
//

import Foundation

class TripObj2 {
    var caption: String
    var photoUrl: String
    var title: String
    var currsize: Int
    var totalsize: Int
    var captionDescription: String
    var captionTime: String
    init(captionText: String, photoUrlString: String, titleText: String, totalSize: Int, currentSize: Int, description: String, time: String) {
        caption = captionText
        photoUrl = photoUrlString
        title = titleText
        currsize = currentSize
        totalsize = totalSize
        captionDescription = description
        captionTime = time
    }
}
