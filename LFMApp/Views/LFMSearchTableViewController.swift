//
//  LFMSearchTableViewContro    er.swift
//  LFMApp
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit

private let LFMCell = "LFMTableViewCellIdentifier"
class LFMSearchTableViewController: UITableViewController , UITextFieldDelegate{
    
    var viewModel: LFMSearchTableViewViewModel?
    
    var searchText: String?  {
        didSet {
            
          
            self.searchForAlbums()
        }
    }
    
    @IBOutlet weak var searchField: UITextField!{
        didSet {
            searchField.delegate = self
            searchField.text = searchText
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //tableView.reloadData()
        // TODO : A navigation title method will be added
        if self.viewModel == nil {
            self.viewModel = LFMSearchTableViewViewModel(view: self )
        }
        
       
        self.viewModel?.initialViewSetup()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = self.viewModel else {
            return 0
        }
        
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel else {
            return 0
        }
        
        return viewModel.numberOfRowsInSection(section)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchText = textField.text
        return true
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        guard self.viewModel != nil else {
            return
        }
        
        self.viewModel?.viewDidAppear()
        
    }
    
    //TODO: A good place for this method is an extension
    func searchForAlbums() {
      guard let viewModel = self.viewModel else {
       return
      }
        tableView.reloadData()
        
        return viewModel.searchForAlbums(self.searchText)
    
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:LFMCell, for: indexPath) as? LFMTableViewCell
        
        guard let viewModel = viewModel,
            let lfmTableViewCell = cell else {
                return UITableViewCell()
        }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cellViewModel?.view = lfmTableViewCell
        //TODO: This method questionable
         lfmTableViewCell.viewModel = cellViewModel
         lfmTableViewCell.setup()
        
        
        
        return lfmTableViewCell
        
    }
    
    func reloadTableView() -> Void {
   
        self.tableView?.reloadData()
    }
    
}


extension LFMSearchTableViewController: LFMSearchTableViewControllerProtocol {
    

    
}


