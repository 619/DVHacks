//
//  Post.swift
//  DVHacks
//
//  Created by Bobby Zhang on 2018-04-14.
//  Copyright © 2018 com. All rights reserved.
//

import Foundation

class TripObj {
    var caption: String
    var photoUrl: String
    var title: String
    var currsize: Int
    var totalsize: Int
    init(captionText: String, photoUrlString: String, titleText: String, totalSize: Int, currentSize: Int) {
        caption = captionText
        photoUrl = photoUrlString
        title = titleText
        currsize = currentSize
        totalsize = totalSize
    }
}
