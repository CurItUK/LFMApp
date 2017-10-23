//
//  LFMURLSessionProtocol.swift
//  LFMApp
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
protocol LFMURLSessionProtocol: class  {
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) ->  Swift.Void) -> URLSessionDataTask
}


extension URLSession : LFMURLSessionProtocol {
    
}
