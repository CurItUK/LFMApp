//
//  LFMConstants.swift
//  LFMApp
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
typealias ImageArrayData = NSArray
struct LFMConstants  {
    
    /*
     Constants and Utils are always better as nested types
     */
    
    struct LFMAPIKeys {
        
        // Its more descriptive to use keys and less error prone
        // TODO: These keys will be amended later on...
        static let artistKey        = "artist"
        static let nameKey          = "name"
        static let urlKey           = "url"
        static let imageKey         = "image"
        static let imageArrayKey    = "image"
    }
    struct LFMAPIServiceURLS {
        
        // Its more descriptive to use keys and less error prone
        // TODO: These keys will be amended later on...
        static let ALBUM_SEARCH_URL   = "http://ws.audioscrobbler.com/2.0/?method=album.search&album=believe&api_key=9fce79d4d0ec20fd1c05a50f34515ef8&format=json"
        static let ALBUM_BASE_URL = "http://ws.audioscrobbler.com/2.0/?method=album.search&album="
        static let ALBUM_TAIL_URL = "&api_key=9fce79d4d0ec20fd1c05a50f34515ef8&format=json"
    }
    
    
    
}
