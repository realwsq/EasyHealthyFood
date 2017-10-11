//
//  CollectionViewCell.swift
//  CollectionViewBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myLabel: UILabel!
    
    func displayContent(title: String) {
        myLabel = UILabel()
        myLabel.text = title
        
    }
    
}
