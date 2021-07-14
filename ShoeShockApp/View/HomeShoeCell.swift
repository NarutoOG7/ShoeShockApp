//
//  ShoeCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class HomeShoeCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var shoe: Shoe?
    var selectedShoe: SelectedShoe?
    let dataService = DataService.instance
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        guard let shoe = shoe else { return }
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        if dataService.favoritedShoes.firstIndex(of: selectedShoe) != nil {
            dataService.removeShoeFromFavorites(selectedShoe: selectedShoe)
        } else {
            dataService.addShoeToFavorite(selectedShoe: selectedShoe)
        }
        updateView(shoe: shoe)
    }
    
    func updateView(shoe: Shoe) {
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
            shoeImage.image = UIImage(named: shoe.image)
            shoeNameLabel.text = shoe.name
            shoePriceLabel.text = "$\(shoe.price)"
        let imageName = dataService.favoritedShoes.contains(selectedShoe) ? "heart.fill" : "heart"
            self.heartButton.setImage(UIImage(systemName: imageName), for: .normal)
        
    }
    
}




