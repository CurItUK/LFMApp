//
//  MockLFMURLSession.swift
//  LFMAppTests
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import LFMApp
class MockLFMURLSession : LFMURLSessionProtocol {
    
    var dataTaskExpectation:(XCTestExpectation, expectedURL:URL)?
    var _dataTask:MockLFMURLSessionDataTask?
    
    init() {
        self._dataTask = MockLFMURLSessionDataTask()
    }
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
        // Here we confirm if we fulfill the dataTaskExpectation that we created in
        if let (expectation, expectedValue) = self.dataTaskExpectation {
            // Here we make sure operands are equal
            if expectedValue.absoluteString.compare(url.absoluteString) == .orderedSame {
                expectation.fulfill()
            }
        }
        
        self._dataTask?.completionHandler = completionHandler
        return self._dataTask!
    }
    
}
