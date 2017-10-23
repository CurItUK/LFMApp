//
//  LFMTableViewCell.swift
//  LFMApp
//
//  Created by dexter-local on 22/10/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit

class LFMTableViewCell: UITableViewCell {
    
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var generic: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var _imageView: UIImageView!
    
    var viewModel:LFMTableViewCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //  override func setSelected(_ selected: Bool, animated: Bool) {
    //    super.setSelected(selected, animated: animated)
    
    //}
    
    func setup() {
        viewModel?.setup()
    }
    
}


extension LFMTableViewCell : LFMTableViewCellProtocol  {
    
    func setName(_ songName:String) {
        
        self.songName.text = songName
        
    }
    func setGeneric(_ generic:String){
        
        //self.generic.text =  generic
    }
    
    func setURL(_ url:String){
        
        self.url.text =  url
    }
    
    
    func setArtist(_ url:String){
        
        self.generic.text =  url
    }
    
    
    func setImage(img: UIImage?) {
        self._imageView.image = img
        self.setNeedsLayout()
    }
    
    
    
    
}
