//
//  MockLFMServiceManager.swift
//  LFMAppTests
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import LFMApp
class MockLFMServiceManager : LFMServiceManager {
    
    var fetchAlbumsExpectation:(XCTestExpectation, expectedURLString:String)?
    var shouldFailOnFetch:Bool = false
    var dataToReturnOnSuccess:Data?
    
    override func fetchAlbums(urlString: String?, success: @escaping (Data) -> Void, failure: @escaping (NSError) -> Void) {
        
        if let (expectation, expectedValue) = self.fetchAlbumsExpectation {
            if urlString?.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
        
        if shouldFailOnFetch == true {
            failure(NSError(domain: "LFMApp.LFMServiceManager", code:102, userInfo: nil))
            return
        }
        
        if let dataToReturnOnSuccess = dataToReturnOnSuccess {
            success(dataToReturnOnSuccess)
            return
        }
        
        super.fetchAlbums(urlString: urlString, success: success, failure: failure)
    }
}
