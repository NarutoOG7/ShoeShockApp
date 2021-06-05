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
    var shoes = DataService.instance.shoes
    var index = IndexPath()
    var delegate: ShoeCellDelegate?
    

    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        guard let shoe = shoe else { return }
        let selectedProduct = SelectedShoe(shoe: shoe)
        print(shoes[index.row].isInCart)
        print(shoes[index.row].isFavorited)
        shoes[index.row].isFavorited.toggle()
        print(shoes[index.row].isInCart)
        print(shoes[index.row].isFavorited)
        delegate?.didTapHeart(button: heartButton, shoe: shoe)
        shoes[index.row].isInCart.toggle()
        updateView(shoe: shoe)
    }
    
    
    
    func updateView(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = "$\(shoe.price)"
        let imageName = shoes[index.row].isFavorited ? "heart.fill" : "heart"
        self.heartButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}


