//
//  LFMTableViewViewModel.swift
//  LFMApp
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

class LFMSearchTableViewViewModel: NSObject {
    
    
    /*
     ViewModel holds a weak reference to the view to avoid strong reference retain cycles.
     Strong and weak references should be taken into consideration when we are
     creating reference types such as classes. Structs and Enums are value types so using any
     of the ARC keywords would not be applicable in these cases.
     
     */
    weak var view:LFMSearchTableViewControllerProtocol?
    
    /*
     Here we create album object that will hold the album tracks and images data according to service response
     */
    var album: LFMAlbum?
    
    /*
     The initialiser takes reference to the View, we pass protcol as the
     collection vew instead of the controller itself.This creates a loosely coupled
     relationship between viewmodel and view.
     */
    init(view: LFMSearchTableViewControllerProtocol , album: LFMAlbum? = nil) {
        super.init()
        self.view = view
        
     //   if album == nil {
      //      album = LFMAlbum()
       // }
     
        
        self.album = album ?? LFMAlbum()
       // setNavigationTitle(title)
        
    }
    
    func initialViewSetup() {}
    
    
    func viewDidAppear() {
        //  super.viewWillAppear(animated)
         guard album != nil else  {
            return
            
         }
        //TODO: Will add Service Call here
         self.getAlbums()
    }
    
 
    func getAlbums() {
        self.album?.loadAlbums(urlString:  LFMConstants.LFMAPIServiceURLS.ALBUM_SEARCH_URL  ,
                               
                               success : { () in
                                DispatchQueue.main.async {
                                    self.view?.reloadTableView()
 
                                    
                                }
        },
                               failure: { (error) in
                                print(error.description)
        })
    }

    
    
    //TODO: We need  a proper search Validator for the text here
    func searchForAlbums(_ enteredtext: String? ) {
        
        guard let _ = enteredtext  else  { return }
        
        let  str = "\(LFMConstants.LFMAPIServiceURLS.ALBUM_BASE_URL)\(String(describing: enteredtext!))\(LFMConstants.LFMAPIServiceURLS.ALBUM_TAIL_URL)"
       
        self.album?.albums?.removeAll()
        self.album?.loadAlbums(urlString:  str   ,
                                   success : { (data) in
                                    DispatchQueue.main.async {
                                        self.view?.reloadTableView()
                                    }
        },
                                   failure: { (error) in
                                    print(error.description)
        })
    }
    
    
    func numberOfSections() -> Int {
        guard let _ = album,
            let _ = album?.albums else {
                return 0
        }
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int {
        guard let albums = album,
            let _albums =  albums.albums else {
                return 0
        }
        return _albums.count
    }
    
    func cellViewModel(forIndexPath indexPath:IndexPath) -> LFMTableViewCellViewModel? {
        let row = indexPath.row
        
        guard let albumlist = album,
            let _albums = albumlist.albums else {
                return nil
        }
        
        if row < 0 || row >= _albums.count {
            return nil
        }
        
        let albumRow = _albums[row]
        return LFMTableViewCellViewModel(model:albumRow)
    }
    
    
}
