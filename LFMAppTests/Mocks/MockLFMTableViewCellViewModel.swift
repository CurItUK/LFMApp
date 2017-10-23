//
//  MockLFMTableViewCellViewModel.swift
//  LFMAppTests
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import LFMApp
class MockLFMTableViewCellViewModel : LFMTableViewCellViewModel {
    var setupExpectation: XCTestExpectation?
    override func setup() {
        setupExpectation?.fulfill()
    }
    
    
}
