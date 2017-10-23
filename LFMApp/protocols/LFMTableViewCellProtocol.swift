//
//  LFMTableViewCellProtocol.swift
//  LFMApp
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit
protocol LFMTableViewCellProtocol {
    
    func setName(_ name: String)
    func setArtist(_ artist:String)
    func setURL(_ url:String)
    func setImage(img: UIImage? )
    func setGen(_ generic: String)
    
}
