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
    let dataService = DataService.instance
    var cartService = Cart.instance
    var index = IndexPath()
    var delegate: ShoeCellDelegate?
    var cartCell = CartCell()
    var homeVC = HomeVC()
    var cartVC = CartVC()
    var getShoes = DataService.instance.getShoes(forCategoryTitle: HomeVC().displayedCategory)

    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        guard let shoe = shoe else { return }
//        let shoes = dataService.getShoes(forCategoryTitle: homeVC.displayedCategory)
        getShoes[index.row].isFavorited.toggle()
//        shoes[index.row].isFavorited.toggle()
//        shoes[index.row].isInCart.toggle()
        delegate?.didTapHeart(button: heartButton, shoe: shoe)
        updateView(shoe: shoe)
    }
    
    func updateView(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = "$\(shoe.price)"
        let imageName = getShoes[index.row].isFavorited ? "heart.fill" : "heart"
//            let imageName = dataService.getShoes(forCategoryTitle: homeVC.displayedCategory)[index.row].isFavorited ? "heart.fill" : "heart"
        self.heartButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
}




