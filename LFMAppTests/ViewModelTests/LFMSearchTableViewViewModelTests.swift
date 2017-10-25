//
//  LFMSearchTableViewViewModelTests.swift
//  LFMAppTests
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import LFMApp
class LFMSearchTableViewViewModelTests: XCTestCase {
    fileprivate  var mockLFMSearchTableViewController: MockLFMSearchTableViewController?
    
    
    fileprivate var stubLFMAlbumResponseData:Data?
    fileprivate var stubLFMServiceManager:MockLFMServiceManager?
    fileprivate var albumWithStubbedServiceManager:LFMAlbum?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockLFMSearchTableViewController = MockLFMSearchTableViewController()
        stubLFMServiceManager = MockLFMServiceManager()
        albumWithStubbedServiceManager = LFMAlbum()
        albumWithStubbedServiceManager!.albumServiceManager = stubLFMServiceManager!
        let bundle = Bundle(for: type(of:self))
        let path = bundle.path(forResource: "ValidAlbumsData", ofType: "json")
        stubLFMAlbumResponseData = try! Data(contentsOf: URL(fileURLWithPath: path!))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}


// MARK: initialization tests
extension LFMSearchTableViewViewModelTests {
    
    func test_Init_ValidView_InstantiatesObject() {
        let sut = LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        XCTAssertNotNil(sut)
    }
    
    func test_Init_ValidView_CopiesViewToIvar() {
        let sut = LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        
        if let lhs = mockLFMSearchTableViewController, let rhs = sut.view as? MockLFMSearchTableViewController {
            XCTAssertTrue(lhs === rhs)
        }
    }
    
    func test_Init_ValidView_LFMFMAlbums_IVarIsNotNil() {
        let sut = LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        XCTAssertNotNil(sut.album)
    }
    
    
    
}


/*
 // MARK: viewDidAppear tests
 extension LFMSearchTableViewViewModelTests {
 
 
 func test_ViewDidAppear_Calls_ViewDidAppear_OnTableViewController() {
 let expectation = self.expectation(description: "expected viewDidAppear() called")
 mockLFMSearchTableViewController!.viewDidAppearExpectation = expectation
 
 let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
 sut.viewDidAppear()
 
 self.waitForExpectations(timeout: 1.0, handler: nil)
 
 }
 func test_ViewDidAppear_Calls_ViewDidAppear_OnTableViewController() {
 let expectation = self.expectation(description: "expected viewDidAppear() called")
   let sut = LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
 mockLFMSearchTableViewController!.viewDidAppearExpectation = expectation
 sut.viewDidAppear()
 self.waitForExpectations(timeout: 1.0, handler: nil)
 }
 }
 */



// MARK: numberOfSections  tests
extension LFMSearchTableViewViewModelTests {
    func test_NumberOfSections_ValidViewModel_WithAlbums_Retur1() {
        let sut = LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        XCTAssertEqual(sut.numberOfSections(), 1)
    }
    
    func test_NumberOfSections_ValidViewModel_NilAlbums_ReturnsZero() {
        let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        sut.album  = nil
        XCTAssertEqual(sut.numberOfSections(), 0)
    }
    
    
}

//MARK:  numberOfRowsInSection tests
extension LFMSearchTableViewViewModelTests{
    func test_NumberOfRowsInSection_ValidViewModel_Nil_Album_ReturnsZero() {
        let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        sut.album  = nil
        
        XCTAssertEqual(sut.numberOfRowsInSection(0), 0)
    }
    
    func test_NumberOfRowsInSection_NegtiveSectionIndex_ReturnsZero() {
        let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        
        
        XCTAssertEqual(sut.numberOfRowsInSection(-1), 0)
    }
    
    func test_NumberOfRowsInSection_OutOfBoundsSectionIndex_ReturnsZero() {
        let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        
        XCTAssertEqual(sut.numberOfRowsInSection(1000), 0)
    }
    func test_NumberOfRowsInSection_ValidSectionIndex_ReturnsExpectedValue() {
        let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        print(sut.numberOfRowsInSection(0), sut.album!.albums!.count)
        XCTAssertEqual(sut.numberOfRowsInSection(0), sut.album!.albums!.count)
    }
    
}


//MARK:  cellViewModel tests
extension LFMSearchTableViewViewModelTests{
    
    func test_CellViewModel_ValidViewModelWhenAlbumsNil_ReturnsNil() {
        let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        sut.album?.albums = nil
        
        XCTAssertNil(sut.cellViewModel(forIndexPath:IndexPath(row: 0, section: 0)))
    }
    
    
    func test_CellViewModel_RowIndexLessThan0_ReturnsNil() {
        
        let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        sut.album?.albums = [LFMAlbumData]()
        
        XCTAssertNil(sut.cellViewModel(forIndexPath: IndexPath(row: -1, section: 0)))
        
        
    }
    
    func test_CellViewModel_RowIndexEqualToNumberOfAlbums_ReturnsNil() {
        let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        sut.album?.albums = [LFMAlbumData]()
        XCTAssertNil(sut.cellViewModel(forIndexPath: IndexPath(row: 1, section: 0)))
    }
    
    func test_CellViewModel_OutOfBoundsRowIndex_ReturnsNil() {
        let sut =  LFMSearchTableViewViewModel(view:mockLFMSearchTableViewController!)
        
        XCTAssertNil(sut.cellViewModel(forIndexPath: IndexPath(row: 1000, section: 0)))
    }
    
    
}





