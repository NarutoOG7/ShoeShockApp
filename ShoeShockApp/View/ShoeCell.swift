//
//  ShoeCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

protocol ShoeCellDelegate {
    func didTapHeart(button: UIButton, shoe: Shoe)
}

class ShoeCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var shoe: Shoe?
    
    var delegate: ShoeCellDelegate?
    
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        guard var shoe = shoe else { return }
        if heartButton.currentImage == UIImage(systemName: "heart") {
            shoe.isFavorited = true
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            delegate?.didTapHeart(button: heartButton, shoe: shoe)
        } else {
            shoe.isFavorited = false
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    func updateView(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = "$\(shoe.price)"
        
    }
}
