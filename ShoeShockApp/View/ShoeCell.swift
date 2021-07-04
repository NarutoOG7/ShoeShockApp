//
//  ShoeCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

protocol ShoeCellDelegate {
    func didTapHeart(button: UIButton, shoe: SelectedShoe)
}

class ShoeCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var shoe: Shoe?
    var selectedShoe: SelectedShoe?
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
        guard let selectedShoe = selectedShoe else { return }
        dataService.addShoeToFavorite(selectedShoe: selectedShoe)
        selectedShoe.isFavorited.toggle()
//        let shoes = dataService.getShoes(forCategoryTitle: homeVC.displayedCategory)
 //       getShoes[index.row].isFavorited.toggle()
//        shoe.isFavorited.toggle()
//        shoes[index.row].isFavorited.toggle()
//        shoes[index.row].isInCart.toggle()
        delegate?.didTapHeart(button: heartButton, shoe: selectedShoe)
        updateView(shoe: shoe)
        
        selectedShoe.isInCart.toggle()
    }
    
    func updateView(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = "$\(shoe.price)"
        
        guard let selectedShoe = dataService.getFavoriteShoe(shoe: shoe) else { return }
        
            let imageName = selectedShoe.isFavorited ? "heart.fill" : "heart"
            self.heartButton.setImage(UIImage(systemName: imageName), for: .normal)
//            let imageName = dataService.getShoes(forCategoryTitle: homeVC.displayedCategory)[index.row].isFavorited ? "heart.fill" : "heart"
    }
    
}




