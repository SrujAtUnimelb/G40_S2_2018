//
//  ImageCollectionViewCell.swift
//  Instagram
//
//  Created by DAWEIXU on 2018/10/15.
//  Copyright © 2018 unimelb_daweixu. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    
    
    
}
