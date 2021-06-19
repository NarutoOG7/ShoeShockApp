//
//  CartCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

protocol CartCellTableViewDelegate {
    func updateTableView()
    func updateTotalCost(withCost: Double)
}

class CartCell: UITableViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var shoeQuantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var dataService = DataService.instance
    var cart = Cart.instance
    var shoe: Shoe?
    var selectedShoe: SelectedShoe?
    var index = IndexPath()
    var updateTableViewDelegate: CartCellTableViewDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateView(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = "$\(shoe.price)"
        shoeQuantityLabel.text = "\(shoe.quantity)"
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let shoes = dataService.bballShoes
        let shoe = shoes[index.row]
        var shoeQuantity = cart.cart[index.row].quantity
        shoeQuantity = Int(sender.value)
        shoeQuantityLabel.text = String(shoeQuantity)
        
        let cartShoes = cart.cart
        cartShoes[index.row].shoe.quantity = shoeQuantity

        if shoeQuantity == 0 {
            shoes[index.row].isFavorited = false
            shoes[index.row].isInCart = false
            cart.removeShoe(shoe: shoe)
            updateTableViewDelegate?.updateTableView()
        }
        
        let cost = cart.getTotal()
        updateTableViewDelegate?.updateTotalCost(withCost: cost)
        
    }
    
    
}
