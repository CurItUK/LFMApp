//
//  LFMAlbumData.swift
//  LFMApp
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit

class LFMAlbumData<NameData , ArtistData, URLData , GENERICData>: NSObject{
    
    var name:NameData?
    var artist: ArtistData?
    // For now leaving URL field as the Artist Data, will be modified along with requirements later on...
    var url:ArtistData?
    var genericData: GENERICData?
    var imageURL: String?
    var image: UIImage?
    
    
    init?(_ dictionary: [String:AnyObject]?){
        guard let dictionary = dictionary,
            let name = dictionary[LFMConstants.LFMAPIKeys.nameKey] as? NameData,
            let artist   = dictionary[LFMConstants.LFMAPIKeys.artistKey] as? ArtistData ,
            let imageArray  = dictionary[LFMConstants.LFMAPIKeys.imageArrayKey] as? ImageArrayData ,
            let img = imageArray[2] as? NSDictionary,
            let img_URL = img["#text"] as? String
            else  {
                return nil
        }
        super.init()
        self.name   = name
        self.artist =  artist
        self.imageURL = img_URL
        //TODO: DownloadImage Method will be added
        //self.downloadImage()
        // self.genericData = generic
    }
    
 
   
    
}


