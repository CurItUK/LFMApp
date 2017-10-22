//
//  LFMAlbumTests.swift
//  LFMAppTests
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest

@testable import LFMApp

class LFMAlbumTests: XCTestCase {
    
    override func setUp () {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    
}

//MARk: Init Tests
extension LFMAlbumTests {
    
    func testInit_AlbumrrayIsNotNil() {
        let lfmalbums = LFMAlbum()
        XCTAssertNotNil(lfmalbums.albums)
        
    }
    
    
    func testInit_AlbumArrayIsEmpty() {
        let lfmalbums = LFMAlbum()
        XCTAssertNotNil(lfmalbums.albums!.count, String(0) )
        
    }
    
}

