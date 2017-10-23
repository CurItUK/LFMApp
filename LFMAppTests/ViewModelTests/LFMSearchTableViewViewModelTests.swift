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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockLFMSearchTableViewController = MockLFMSearchTableViewController()
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
