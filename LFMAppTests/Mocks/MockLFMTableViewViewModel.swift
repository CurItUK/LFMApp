//
//  MockLFMTableViewViewModel.swift
//  LFMAppTests
//
//  Created by dexter-local on 24/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import Foundation
import XCTest
@testable import LFMApp
class MockLFMTableViewViewModel : LFMSearchTableViewViewModel {
    
    var initialViewSetupExpectation: XCTestExpectation?
    var numberOfSectionsExpectation: XCTestExpectation?
    var numberOfRowsInSectionExpectation: (XCTestExpectation , numRows:Int)?
    var cellViewModelExpectation: (XCTestExpectation, expectedIndexPath:IndexPath)?
  //  var setNavigationTitleExpectation: XCTestExpectation?
     var searchForAlbumsExpectation:  (XCTestExpectation? , enteredtext:String)?
     
    
    override func initialViewSetup() {
        initialViewSetupExpectation?.fulfill()
        
        initialViewSetupExpectation = nil
    }
    
 //   override func setNavigationTitle(_ title:String){
        
   //     self.setNavigationTitleExpectation?.fulfill()
     //   self.setNavigationTitleExpectation = nil
   // }
    
    
    override func searchForAlbums(_ enteredtext: String?) {
        
        if let (expectation, expectedValue) = self.searchForAlbumsExpectation {
            if enteredtext?.compare(expectedValue) == .orderedSame {
                expectation?.fulfill()
            }
        }
        
        
        
        super.searchForAlbums(enteredtext )
    }
    
    
    override  func numberOfSections() -> Int {
        numberOfSectionsExpectation?.fulfill()
        return 0
    }
    
    override func numberOfRowsInSection(_ section:Int) -> Int {
        
        
        //numberOfRowsInSectionExpectation?.fulfill()
        
        if let (expectation, expectedValue) = self.numberOfRowsInSectionExpectation {
            if section == expectedValue {
                expectation.fulfill()
            }
        }
        return 0
    }
    
    override func cellViewModel(forIndexPath indexPath:IndexPath) -> LFMTableViewCellViewModel? {
        if let (expectation, expectedValue) = self.cellViewModelExpectation {
            if indexPath == expectedValue {
                expectation.fulfill()
            }
        }
        
        return nil
    }

}
