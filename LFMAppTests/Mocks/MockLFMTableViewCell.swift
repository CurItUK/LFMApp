//
//  MockLFMTableViewCell.swift
//  LFMAppTests
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import LFMApp
class MockLFMTableViewCell: LFMTableViewCell {
    

    var expectationSetSongName:(XCTestExpectation, String)?
    var expectationSetArtist:(XCTestExpectation, String)?
    var expectationSetURL:(XCTestExpectation, String)?
    
    override func setName(_ songName: String) {
        guard let (expectation, expectedValue) = self.expectationSetSongName else {
            super.setName(songName)
            return
        }
        
        if songName.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setName(songName)
    }
    
    
    override func setArtist(_ artist: String) {
        
        guard let (expectation, expectedValue) = self.expectationSetArtist else {
            super.setArtist(artist)
            return
        }
        
        if artist.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setArtist(artist)
    }
    
    override func setURL(_ url: String) {
        
        guard let (expectation, expectedValue) = self.expectationSetURL else {
            super.setGen(url)
            return
        }
        
        if url.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setGen(url)
    }
    
    
}





