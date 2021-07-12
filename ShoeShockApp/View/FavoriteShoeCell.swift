//
//  FavoriteShoeCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 7/8/21.
//

import UIKit

protocol FavoriteShoeCellDelegate {
    func updateCollectionView()
}

class FavoriteShoeCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var shoeTitle: UITextField!
    
    var shoe: Shoe?
    var delegate: FavoriteShoeCellDelegate?
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        delegate?.updateCollectionView()
    }
    
    func updateView(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.image)
        shoeTitle.text = shoe.name
    }
}
