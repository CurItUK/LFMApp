//
//  LFMServicesTests.swift
//  LFMAppTests
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import LFMApp

class LFMServiceManagerTests: XCTestCase  {
    //let albumsURL:String =  LFMConsta
    let albumsURL: String  = LFMConstants.LFMAPIServiceURLS.ALBUM_SEARCH_URL
    let emptyURL:  String  = ""
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    /***
     There are a few codes to test on service manager dependign on valid session and data tasks
     ***/
    func test_fetchAlbums_nilSession_fails_ReturnsErrorCode100() {
        // Here we create expectations for service failurees
        let expectation = self.expectation(description: "Failure Closure returns error code = 100")
        
        let serviceManager = LFMServiceManager()
        serviceManager.session = nil
        
        serviceManager.fetchAlbums(urlString: albumsURL,
                                   success: { (albumData) in
                                    
        },
                                   failure:{ (albumError) in
                                    if albumError.code == 100 {
                                        expectation.fulfill()
                                    }
                                    
                                    
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_fetchAlbums_nilURL_fails_ReturnsErrorCode100() {
        let expectation = self.expectation(description: "Failure  returns error code = 101")
        
        let serviceManager = LFMServiceManager()
        
        serviceManager.fetchAlbums(urlString: nil,
                                   success: { (albumData) in
                                    
        },
                                   failure:{ (albumError) in
                                    if albumError.code == 101 {
                                        expectation.fulfill()
                                    }
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    
    func test_fetchAlbums_emptyURL_fails_ReturnsErrorCode101() {
        let expectation = self.expectation(description: "Failure  returns error code = 101")
        
        let serviceManager = LFMServiceManager()
        
        serviceManager.fetchAlbums(urlString:emptyURL,
                                   success: { (albumData) in
                                    
        },
                                   failure:{ (albumError) in
                                    if albumError.code == 101 {
                                        expectation.fulfill()
                                    }
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    /*
     At this point we need to modify plist file to allow http connections...
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    
    func test_fetchAlbums_validURL_callsDataTask_onURLSession_withTheSameURL() {
        
        guard let expectedURL = URL(string: albumsURL) else {
            return
        }
        
        let expectation = self.expectation(description: "Expected dataTask called on URLSession")
        // Test epectation Coompares returning and expectedURLS via testExpectation
        let mockLFMURLSession = MockLFMURLSession()
        mockLFMURLSession.dataTaskExpectation = (expectation, expectedURL)
        
        
        // Service Manager uses Mocked session to complete the test
        // Since Mocks use the same Protocols we implement the same methods via Mocks and complete the tests
        let serviceManager = LFMServiceManager()
        serviceManager.session = mockLFMURLSession
        
        
        serviceManager.fetchAlbums(urlString: albumsURL,
                                   success: { (albumData) in
                                    
        },
                                   failure:{ (albumError) in
                                    
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_fetchAlbums_validAlbumURL_validDataTask_callsResume_onDataTask() {
        
        let expectation = self.expectation(description: "Expected dataTask called on URLSession")
        
        let mockLFMURLSession = MockLFMURLSession()
        mockLFMURLSession._dataTask?.resumeExpectation = expectation
        // Service Manager uses Mocked session to complete the test
        // Since Mocks use the same Protocols we implement the same methods via Mocks and complete the tests
        let serviceManager = LFMServiceManager()
        serviceManager.session = mockLFMURLSession
        
        serviceManager.fetchAlbums(urlString: albumsURL,
                                   success: { (albumData) in
                                    // do nothing
        },
                                   failure:{ (albumError) in
                                    // do nothing
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}

