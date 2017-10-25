//
//  LFMSearchTableViewControllerTests.swift
//  LFMAppTests
//
//  Created by dexter-local on 24/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import Foundation
import XCTest

@testable import LFMApp

class LFMSearchTableViewControllertests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    
}

//




//MARK: ViewDidLoad Tests
extension LFMSearchTableViewControllertests {
    
    
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        let sut = LFMSearchTableViewController()
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_ViewModelIsNotNilAfterViewDidLoad() {
        let sut = LFMSearchTableViewController()
        sut.viewDidLoad()
        
        XCTAssertNotNil(sut.viewModel)
    }
    
    
    
    
}







//MARK: InitialViewSetup Tests
extension LFMSearchTableViewControllertests {
    
    func test_InitialSetup_OnViewModel() {
        
        weak var expectation = self.expectation(description: "expecting initialViewSetup()  called")
        
        let sut = LFMSearchTableViewController()
        
        let viewModel = MockLFMTableViewViewModel(view:sut  )
        viewModel.initialViewSetupExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.viewDidLoad()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}

// TODO: Set Title methods will be added here
/*
//MARK: setNavigationTitleTests
extension LFMSearchTableViewControllertests {
    
    func test_setNavigationTitle_OnViewModel() {
        
        weak var expectation = self.expectation(description: "expecting setNavigationTitle()  called")
        
        let sut = LFMSearchTableViewController()
        
        let viewModel = MockLFMTableViewViewModel(view:sut  )
        viewModel.setNavigationTitleExpectation = expectation
        
        sut.viewModel = viewModel
        
       // sut.setNavigationTitle("title")
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}

*/


//MARK: numberOfSections Tests
extension LFMSearchTableViewControllertests {
    
    func test_NumberOfSections_Calls_NumberOfSections_OnViewModel() {
        let expectation = self.expectation(description: "expecting numberOfSections() called")
        
        
        let sut = LFMSearchTableViewController()
        
        let viewModel = MockLFMTableViewViewModel(view:sut)
        
        viewModel.numberOfSectionsExpectation = expectation
        
        sut.viewModel = viewModel
        
        let _ = sut.numberOfSections(in: UITableViewStub())
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}

//--


//MARK: searchForAlbums Tests
extension LFMSearchTableViewControllertests {
    
    func test_SearchForTextNumberOfSections_Calls_SearchForText_OnViewModel() {
        let expectation = self.expectation(description: "expecting searchForAlbums() called")
        
        
        let sut = LFMSearchTableViewController()
        
        let viewModel = MockLFMTableViewViewModel(view:sut)
        sut.searchText = "Believe"
        viewModel.searchForAlbumsExpectation = (expectation , sut.searchText!)
        
        sut.viewModel = viewModel
        
        sut.searchForAlbums()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}

//--


//MARK: Test numberOfRowsInSection
extension LFMSearchTableViewControllertests {
    
    
    func test_NumberOfRowsInSection_ValidViewModel_Calls_NumberOfRowsInSection_OnViewModel() {
        
        let expectation = self.expectation(description: "expecting  numberOfItemsInSection()  called")
        
        let sut = LFMSearchTableViewController()
        
        let stubbedTableView = UITableViewStub()
        sut.view = stubbedTableView
        
        let viewModel = MockLFMTableViewViewModel(view:sut  )
        viewModel.numberOfRowsInSectionExpectation = (expectation, 1)
        
        sut.viewModel = viewModel
        
        let _ = sut.tableView(stubbedTableView, numberOfRowsInSection: 1)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}


//MARK: cellviewmodel Tests
extension LFMSearchTableViewControllertests {
    
    func test_CellForRow_ValidViewModel_Calls_CellViewModel_OnViewModel() {
        
        let expectation = self.expectation(description: "expecting cellViewModel() called")
        
        let stubbedTableView = UITableViewStub()
        
        let sut = LFMSearchTableViewController()
        sut.view = stubbedTableView
        
        let viewModel = MockLFMTableViewViewModel(view:sut )
        viewModel.cellViewModelExpectation = (expectation, IndexPath(row: 0, section: 0))
        
        sut.viewModel = viewModel
        
        let _ = sut.tableView(stubbedTableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        //let _ = sut.tableView(stubbedTableView)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}



