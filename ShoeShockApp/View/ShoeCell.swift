//
//  ShoeCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

protocol ShoeCellDelegate {
    func didTapHeart(button: UIButton, selectedShoe: SelectedShoe)
}

class ShoeCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var shoe: Shoe?
    var selectedShoe: SelectedShoe?
    let dataService = DataService.instance
    var cartService = CartService.instance
    var index = IndexPath()
    var delegate: ShoeCellDelegate?
    
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        guard let shoe = shoe else { return }
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
//        let getShoes = dataService.getShoes(forCategoryTitle: HomeVC().displayedCategory)
//        if cartService.cart.contains(selectedShoe) {
//            guard let newIndex = cartService.cart.firstIndex(of: selectedShoe) else { return }
//            
//        }
        delegate?.didTapHeart(button: heartButton, selectedShoe: selectedShoe)
        selectedShoe.isFavorited.toggle()
        updateView(shoe: shoe)
    }
    
    func updateHeartView(selectedShoe: SelectedShoe) {

    }
    
    func updateView(shoe: Shoe) {
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
            shoeImage.image = UIImage(named: shoe.image)
            shoeNameLabel.text = shoe.name
            shoePriceLabel.text = "$\(shoe.price)"
        guard let index = dataService.favoritedShoes.firstIndex(of: selectedShoe) else { return }
        let imageName = dataService.favoritedShoes[index].isFavorited ? "heart.fill" : "heart"
            self.heartButton.setImage(UIImage(systemName: imageName), for: .normal)
        
    }
    
}




