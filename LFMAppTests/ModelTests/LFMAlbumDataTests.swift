//
//  LFMAlbumDataTests.swift
//  LFMAppTests
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import LFMApp

class LFMAlbumDataTests: XCTestCase {
 
    var invalidDic: [String: AnyObject]?
    var missingArtistDic: [String: AnyObject]?
    var validDic: [String:AnyObject]?
    var missingNameDic: [String:AnyObject]?
    
    override func setUp() {
        super.setUp()
        
        validDic = [String : AnyObject]()
        validDic![LFMConstants.LFMAPIKeys.artistKey] = "artist"  as AnyObject
        validDic![LFMConstants.LFMAPIKeys.nameKey] =  "artistname" as AnyObject
        var validimg = [[String: AnyObject]]()
        validimg.append([String: AnyObject]())
        validimg.append([String: AnyObject]())
        validimg.append([String: AnyObject]())
        validimg[2]["#text"] =  "http://" as AnyObject
        validDic![LFMConstants.LFMAPIKeys.imageArrayKey] = validimg as NSArray
        
        missingArtistDic = [String : AnyObject]()
        missingArtistDic![LFMConstants.LFMAPIKeys.nameKey] = "artistName" as AnyObject
        
        
        missingNameDic = [String : AnyObject]()
        missingNameDic![LFMConstants.LFMAPIKeys.artistKey] = "artistName" as AnyObject
        
        
   }
    
    override func tearDown() {
        
        super.tearDown()
    }
}


// MARK: Initialisation

extension LFMAlbumDataTests {
    
    func test_Init_NilDictionary_ReturnsNilAlbums() {
        let sut = LFMAlbumData<String, String, String, String>(nil)
        XCTAssertNil(sut)
    }
    
    func test_Init_Dictionary_WhenNameisMissing_ReturnsNilAlbums() {
        let sut = LFMAlbumData<String, String, String, String>(missingNameDic)
        XCTAssertNil(sut)
    }
    
    
    
    func test_Init_Dictionary_WhenArtistIsMissing_ReturnsNilAlbums() {
        let sut = LFMAlbumData<String, String, String, String>(missingArtistDic)
        XCTAssertNil(sut)
    }
    
    func test_Init_ValidDictionary_CreateAlbums() {
        let sut = LFMAlbumData<String, String, String, String>(validDic)
        XCTAssertNotNil(sut)
        
    }
    
    func test_Init_ValidDictionary_CreatesName() {
        let sut = LFMAlbumData<String, String, String, String>(validDic)
        XCTAssertEqual(sut!.name!, validDic?[LFMConstants.LFMAPIKeys.nameKey] as! String)
    }
    
    func test_Init_ValidDictionary_CreatesArtist() {
        let sut = LFMAlbumData<String, String, String, String>(validDic)
        XCTAssertEqual(sut!.artist!, validDic?[LFMConstants.LFMAPIKeys.artistKey] as! String)
    }
    
}



