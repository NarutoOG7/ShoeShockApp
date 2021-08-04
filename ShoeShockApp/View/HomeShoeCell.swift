//
//  ShoeCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class HomeShoeCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeBrandLabel: UILabel!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var newLabel: UILabel!
    
    var shoe: Shoe?
    var selectedShoe: SelectedShoe?
    let dataService = DataService.instance
    var collectionView = ""
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        heartTapped()
    }
    @IBAction func moreHeartPressed(_ sender: UIButton) {
        heartTapped()
    }
    
    func heartTapped() {
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
        
        shoeBrandLabel.text = shoe.brand
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = String(format: "$%.2f", shoe.price)
        let imageName = dataService.favoritedShoes.contains(selectedShoe) ? "heart.fill" : "heart"
        self.heartButton.setImage(UIImage(systemName: imageName), for: .normal)
        if collectionView == "more" {
            newLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
            shoeImage.image = UIImage(named: shoe.images[1])
        } else {
            shoeImage.image = UIImage(named: shoe.images[0])            
        }
        manageColors(shoe: shoe)
        
        
    }
    
    func manageColors(shoe: Shoe) {
        if collectionView == "main" {
            switch shoe.color {
            case "Yellow":
                colorView.backgroundColor = #colorLiteral(red: 0.2042783797, green: 0.3222076893, blue: 0.7527406812, alpha: 1)
            case "Orange":
                colorView.backgroundColor = #colorLiteral(red: 1, green: 0.5751052266, blue: 0.1020977928, alpha: 1)
            case "Red":
                colorView.backgroundColor = #colorLiteral(red: 0.8287264109, green: 0.2369448543, blue: 0.2414448261, alpha: 1)
            case "Teal":
                colorView.backgroundColor = #colorLiteral(red: 0.4455852509, green: 0.7662628889, blue: 0.7618182302, alpha: 1)
            case "Pink":
                colorView.backgroundColor = #colorLiteral(red: 0.8391886353, green: 0.384077251, blue: 0.4953073859, alpha: 1)
            case "Rainbow":
                colorView.backgroundColor = #colorLiteral(red: 0.777528584, green: 0.1387701929, blue: 0.3861692548, alpha: 1)
            case "Gold":
                colorView.backgroundColor = #colorLiteral(red: 0.922393024, green: 0.8218020797, blue: 0.6735435128, alpha: 1)
            default:
                colorView.backgroundColor = #colorLiteral(red: 0.5885350571, green: 0.4915484524, blue: 0.5867741847, alpha: 1)
            }
            colorView.layer.cornerRadius = 20
        }
    }
    
}




