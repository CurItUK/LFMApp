//
//  LFMAlbum.swift
//  LFMApp
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
class LFMAlbum: NSObject {
    
    //Since we have three different types of search results we are using generics here.
    var albums:[LFMAlbumData<String, String , String, String >]?
    
   
    override init() {
        super.init()
        // Check if Album exists  then create a new one with the associated type
        if albums == nil {
            albums = [LFMAlbumData<String, String, String , String >]()
        }
    }
 
}

