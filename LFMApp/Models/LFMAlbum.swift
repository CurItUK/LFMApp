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
    var albumServiceManager = LFMServiceManager()
    
   
    override init() {
        super.init()
        // Check if Album exists  then create a new one with the associated type
        if albums == nil {
            albums = [LFMAlbumData<String, String, String , String >]()
        }
    }
    
    
    func loadAlbums(urlString:String?,
                    success:@escaping (Void) -> Void,
                    failure:@escaping (NSError) -> Void) -> Void {
        //self.albums?.removeAll()
        albumServiceManager.fetchAlbums(urlString: urlString,
                                        
                                        success: { (receivedData) in
                                           // if let array = try? JSONSerialization.jsonObject(with: receivedData, options:  JSONSerialization.ReadingOptions.allowFragments){
                                            if let array = try? JSONSerialization.jsonObject(with: receivedData   ){
                                                
                                                if let __albums = ((array as! NSDictionary).object (forKey : "results") as? NSDictionary ) {
                                                    let ldic = __albums["albummatches"]  as? NSDictionary
                                                    
                                                    let dic  = ldic!["album"] as? NSArray
                                                    for iitem in dic!{
                                                        guard iitem is NSDictionary else {
                                                            continue
                                                        }
                                                        
                                                        self.albums?.append(LFMAlbumData(iitem as? [String:AnyObject])!)
                                                       
                                                        
                                                    }
                                                     success(())
                                                    
                                                }else {
                                                    
                                                    failure(NSError(domain: "LLBLastFMApp.Albums", code:200, userInfo: nil))
                                                    return
                                                }
                                                
                                            }
                                            
        },
                                        failure: { (error) in
                                            failure(error)
        })
        
    }
}


