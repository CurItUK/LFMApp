//
//  LFMServiceManager.swift
//  LFMApp
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

class LFMServiceManager: NSObject {
    // Writing session as protocol makes it easy decoupling and testing
    var session: LFMURLSessionProtocol?
    /*
     Here we create the URLSessionDataTask needed for json service manager
     */
    private var dataTask: URLSessionDataTask?
    
    override init() {
        super.init()
        let config = URLSessionConfiguration.default
        self.session = URLSession(configuration: config )
    }
    
    //Fetch albums is the method that we call the service
    //The album call takes some time therefore we use @escaping parameters
    func fetchAlbums(urlString:String?,
                     success:@escaping (Data) -> Void,
                     failure:@escaping (NSError) -> Void) -> Void {
        // Make sure session is valid
        guard let session = session else {
            failure(NSError(domain: "LFMServiceManager", code:100, userInfo: nil))
            return
        }
        //Make sure URL String is valid here
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
                failure(NSError(domain: "LFMServiceManager", code:101, userInfo: nil))
                return
        }
        // Here we pass in the dataTask closure
        dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
                failure(error as NSError)
                return
            }
            
            if let response = response as? HTTPURLResponse,
                let data = data {
                if response.statusCode == 200 {
                    success(data)
                    return
                }
            }
            
            failure(NSError(domain: "LFMServiceManager", code:102, userInfo: nil))
            return
        })
        
        dataTask?.resume()
    }
    
}

