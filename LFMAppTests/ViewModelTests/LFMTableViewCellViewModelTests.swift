//
//  LFMTableViewCellViewModelTests.swift
//  LFMAppTests
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import LFMApp
class LFMTableViewCellViewModelTests: XCTestCase {
    fileprivate var mockLFMTableViewCell:MockLFMTableViewCell?
    fileprivate var model: LFMAlbumData<String, String, String, String>?
    var songNameStub:UILabelStub?
    var urlStub:UILabelStub?
    var genericStub: UILabelStub?
    var validDic: [String : AnyObject]?
        
    override func setUp() {
        super.setUp()
        // ValidDictionary could be a constant in a constant file as it s been used in a few places
        validDic = [String : AnyObject]()
        validDic![LFMConstants.LFMAPIKeys.artistKey] = "artist"  as AnyObject
        validDic![LFMConstants.LFMAPIKeys.nameKey] =  "songname" as AnyObject
        var validimg = [[String: AnyObject]]()
        validimg.append([String: AnyObject]())
        validimg.append([String: AnyObject]())
        validimg.append([String: AnyObject]())
        validimg[2]["#text"] =  "http://" as AnyObject
        validDic![LFMConstants.LFMAPIKeys.imageArrayKey] = validimg as NSArray
        
        self.model  = LFMAlbumData(validDic)
        mockLFMTableViewCell = MockLFMTableViewCell()
        songNameStub = UILabelStub()
        urlStub = UILabelStub()
        genericStub = UILabelStub()
        mockLFMTableViewCell!.songName = songNameStub
        mockLFMTableViewCell!.url = urlStub
        mockLFMTableViewCell!.generic = genericStub
    }
    override func tearDown() {
        
        super.tearDown()
    }
}


// MARK: initialization tests
extension LFMTableViewCellViewModelTests {
    
    func test_Init_NilModel_DoesNotInstantiateObject() {
        let sut = LFMTableViewCellViewModel(model:nil)
        XCTAssertNil(sut)
    }
    
    func testInit_ValidModel_InstantiatesObject() {
        let sut = LFMTableViewCellViewModel(model:nil)
        XCTAssertNil(sut)
    }
    
    func testInit_ValidModel_CopiesModelToIvar() {
        let sut =  LFMTableViewCellViewModel(model:model)
        XCTAssertTrue(model === sut?.model!)
    }
    
}


//MARK: set Tests
extension LFMTableViewCellViewModelTests {
    
    
    
    func test_AlbumData_Calls_SetName(){
    
        let expectation = self.expectation(description: "expected setSongName() to be called")
        mockLFMTableViewCell?.expectationSetSongName = (expectation, "songname")
        let sut = LFMTableViewCellViewModel(model:LFMAlbumData(validDic))
        sut?.view = mockLFMTableViewCell
        
        sut!.setName("songname")
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_ValidAlbumData_Calls_SetArtist(){
        
     
        let expectation = self.expectation(description: "expected setArtist() to be called")
        mockLFMTableViewCell?.expectationSetArtist = (expectation , "artist")
        let sut = LFMTableViewCellViewModel(model:LFMAlbumData(validDic))
        sut?.view = mockLFMTableViewCell
        
        sut!.setArtist("artist")
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    //TODO: SetURL still places artist as the url label will be modified per design
    func test_ValidAlbumData_Calls_SetURL(){
        
        let expectation = self.expectation(description: "expected setURL() to be called")
        mockLFMTableViewCell?.expectationSetURL = (expectation , "artist")
        let sut = LFMTableViewCellViewModel(model:LFMAlbumData(validDic))
        sut?.view = mockLFMTableViewCell
        
        sut!.setURL("artist")
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}
