//
//  LFMTableViewCellViewModel.swift
//  LFMApp
//
//  Created by dexter-local on 23/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit
class LFMTableViewCellViewModel : NSObject {
    
    weak var model:LFMAlbumData<String, String , String, String>?
    var view :LFMTableViewCellProtocol?
    fileprivate var _image: UIImage?
    init?(model:LFMAlbumData<String, String , String, String>?) {
        guard let model = model else {
            return nil
        }
        
        super.init()
        self.model = model
        model.imageDownloadlistener = self
    }
    //TODO: View and image are not there yet, _ names added to remove warnings
    func setup() {
   
        guard let view = view ,
            let model = model,
            let name = model.name,
            let artist = model.artist else {
                return
        }
        view.setName(name)
        view.setArtist(artist)
        view.setURL(artist)
         view.setImage(img: model.downloadedImage)
       //  _image = image
        
  
        
    }
    /*
     Seding the data to the view making it loosely coupled via protocols
     */
    
    func setName(_ name: String){
        
        view!.setName(name)
    }
    /*
     Sending the artist data to View via protocols
     */
    func setArtist(_ artist:String){
        
        view!.setArtist(artist)
        
    }
    /**
     I was expecting a more complicated
     UI with more data I am leaving the URL as is and sending the artist data for now maybe we can add some other data in place
     in the near future..
     **/
    func setURL(_ url:String){
        view!.setURL(url)
        
    }
    /*
     Sending the image data to be displayed in UIImageView
     */
    func setImage (_ img: UIImage) {
        // view!.setImage(img)
        
        
    }
    
}

extension LFMTableViewCellViewModel : ImageDownloadedListenerProtocol {
    func imageDownloaded () -> Void {
        DispatchQueue.main.async {
            self.view?.setImage (img: self.model?.downloadedImage )
        }
    }
}




