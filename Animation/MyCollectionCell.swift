//
//  MyCollectionCell.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/10/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

class MyCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setGalleryItem(_ item:ItemModel) {
        imageView.image = UIImage(named: item.imageUrl)
    }
}
