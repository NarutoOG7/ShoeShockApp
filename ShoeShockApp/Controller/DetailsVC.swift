//
//  DetailsVC.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var shoeDetailsTextView: UITextView!
    @IBOutlet weak var addToFavorites: UIButton!
    
    var shoe: Shoe?
    var dataService = DataService.instance
    let cartService = CartService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        updateView()
        
    }
    
    func updateView() {
        guard let shoe = shoe else { return }
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        shoeNameLabel.text = shoe.name
        shoeImage.image = UIImage(named: shoe.image)
        shoePriceLabel.text = String(format: "$%.2f", shoe.price)
        shoeDetailsTextView.text = shoe.details
        let favTitle = dataService.favoritedShoes.firstIndex(of: selectedShoe) != nil ? "FAVORITED" : "ADD TO FAVORITES"
        self.addToFavorites.setTitle(favTitle, for: .normal)
    }
    
    @IBAction func addToFavoritesPressed(_ sender: UIButton) {
        guard let shoe = shoe else { return }
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        if dataService.favoritedShoes.firstIndex(of: selectedShoe) != nil {
            dataService.removeShoeFromFavorites(selectedShoe: selectedShoe)
        } else {
            dataService.addShoeToFavorite(selectedShoe: selectedShoe)
        }
        updateView()
    }
    
    @IBAction func addToBagPressed(_ sender: UIButton) {
        guard let shoe = shoe else { return }
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        cartService.addShoe(shoe: selectedShoe.shoe)
        updateView()
    }
    

}
