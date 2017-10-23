//
//  UITableViewStub.swift
//  LFMAppTests
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit
@testable import LFMApp
class UITableViewStub: UITableView {
    
    init() {
        super.init(frame: CGRect.zero ,  style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder){
        
        super.init(coder: aDecoder)
        
    }
    
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return LFMTableViewCell()
    }
    
}
