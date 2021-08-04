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

    @IBOutlet weak var shoeTitle: UILabel!
    
    var shoe: Shoe?
    var delegate: FavoriteShoeCellDelegate?
    var dataService = DataService.instance
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        guard let shoe = shoe else { return }
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        if dataService.favoritedShoes.firstIndex(of: selectedShoe) != nil {
            dataService.removeShoeFromFavorites(selectedShoe: selectedShoe)
        } else {
            dataService.addShoeToFavorite(selectedShoe: selectedShoe)
        }
        delegate?.updateCollectionView()
    }
    
    func updateView(shoe: Shoe) {
<<<<<<< HEAD
        shoeImage.image = UIImage(named: shoe.image)
=======
        shoeImage.image = UIImage(named: shoe.images[0])
>>>>>>> noSectionHeader
        shoeTitle.text = shoe.name
    }
}
