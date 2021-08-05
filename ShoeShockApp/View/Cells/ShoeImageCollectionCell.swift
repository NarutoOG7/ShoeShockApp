//
//  ShoeImageCollectionCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 8/1/21.
//

import UIKit

class ShoeImageCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    
    var shoe: Shoe?
    
    func updateUI(image: String) {
        shoeImage.image = UIImage(named: image)
    }
}
