//
//  ShoeCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

protocol ShoeCellDelegate {
    func didTapHeart(button: UIButton, shoe: Shoe)
    func removeShoe(button: UIButton, shoe: Shoe)
    func addShoe(button: UIButton, shoe: Shoe)
}

class ShoeCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var shoe: Shoe?
    var index = IndexPath()
    var delegate: ShoeCellDelegate?
    
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
//        guard var shoe = shoe else { return }
//                if heartButton.currentImage == UIImage(systemName: "heart") {
//                    shoe.isFavorited = true
//                    shoe.isInCart = true
//                    heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//                    delegate?.didTapHeart(button: heartButton, shoe: shoe)
//                } else {
//                    shoe.isFavorited = false
//                    shoe.isInCart = false
//                    heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
//                }
////        shoe.isFavorited.toggle()
////        if shoe.isFavorited {
////            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
////            delegate?.didTapHeart(button: heartButton, shoe: shoe)
////        } else {
////            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
////        }
//    }
    
    
        guard var selectedShoe = shoe else { return }
        
        DataService.instance.shoes[index.row].isFavorited.toggle()
        
//        if selectedShoe.isInCart {
//            selectedShoe.isFavorited = false
//            print("Favorited is \(selectedShoe.isFavorited)")
//            delegate?.removeShoe(button: heartButton, shoe: selectedShoe)
//        } else if !selectedShoe.isInCart {
//            selectedShoe.isFavorited = true
//            print("Favorited is \(selectedShoe.isFavorited)")
//            delegate?.addShoe(button: heartButton, shoe: selectedShoe)
//        }
        
//        if DataService.cart.contains(selectedShoe) {
//            selectedShoe.isFavorited = false
//            delegate?.removeShoe(button: heartButton, shoe: selectedShoe)
//        } else {
//            selectedShoe.isFavorited = true
//            delegate?.addShoe(button: heartButton, shoe: selectedShoe)
        
        
//        shoe.isFavorited.toggle()
        print(selectedShoe.isFavorited)
        let imageName = selectedShoe.isFavorited ? "heart.fill" : "heart"
        heartButton.setImage(UIImage(systemName: imageName), for: .normal)
//        delegate?.didTapHeart(button: sender, shoe: shoe)
    }


    
    func updateView(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = "$\(shoe.price)"
        
    }
}


