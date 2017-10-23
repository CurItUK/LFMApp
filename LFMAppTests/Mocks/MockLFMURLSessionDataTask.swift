//
//  MockLFMURLSessionDataTask.swift
//  LFMAppTests
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import LFMApp
class MockLFMURLSessionDataTask : URLSessionDataTask {
    // We have one resume expectation
    var resumeExpectation: XCTestExpectation?
    //Json Completion Handler is defined here
    var completionHandler:((Data?, URLResponse?, Error?) -> Swift.Void)?
    // Here we define variables to pass in Completion Handler on Completion
    var dataToReturn:Data?
    var urlResponseToReturn:URLResponse?
    var errorToReturn:Error?
    
    override func resume() {
        resumeExpectation?.fulfill()
        
        if let completionHandler = completionHandler {
            // Call is asyncronous therefore we need to dispatch After GCD here
            //to run completion handler in 0.1 seconds
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                // Now we can call the completion handler
                completionHandler(self.dataToReturn, self.urlResponseToReturn, self.errorToReturn)
            }
            
        }
    }
}
