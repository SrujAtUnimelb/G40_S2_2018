//
//  ImageFlowLayout.swift
//  Instagram
//
//  Created by DAWEIXU on 2018/10/15.
//  Copyright © 2018 unimelb_daweixu. All rights reserved.
//

import UIKit

class ImageFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize{
        set {}
        get {
            let numberOfColumns: CGFloat = 3
            let itemWidth = (self.collectionView!.frame.width - (numberOfColumns - 1))/numberOfColumns
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    //For imageCollection Layout
    func setupLayout(){
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
}
