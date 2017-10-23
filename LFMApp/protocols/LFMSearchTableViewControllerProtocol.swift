//
//  LFMSearchTableViewControllerProtocol.swift
//  LFMApp
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

/***
 Here we create a protocol that extends to class. One of the greatest features of
 Swift and POP is we can now extend protocols to Value types Enums and Structs and not only limited to Reference Types.
 In single inheritence environments base classes could go fat and complicated and error prone. With using POP we can inherit, compose extend protocols, protocols are just like interfaces with full on skills. Here we create loose coupling via protocols.
 Since we ll declare weak variables for classes  (refrence types) throughoout the application we make sure that we make protcols for Classes
 ***/
protocol LFMSearchTableViewControllerProtocol: class{
    func reloadTableView()
}

