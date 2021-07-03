//
//  CartCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

protocol CartCellTableViewDelegate {
    func updateTableView()
    func updateTotalCost()
}

class CartCell: UITableViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var shoeQuantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var shoe: Shoe?
    var dataService = DataService.instance
    var cartService = Cart.instance
    var selectedShoe: SelectedShoe?
    var cart = Cart.instance.cart
    var tableViewDelegate: CartCellTableViewDelegate?
      
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateView(shoe: Shoe) {
        guard let selectedShoe = selectedShoe else { return }
        shoeImage.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = "$\(shoe.price)"
        shoeQuantityLabel.text = "\(selectedShoe.quantity)"
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        guard let shoe = shoe else { return }
        let shoeQuantity = Int(stepper.value)
        let selectedShoe = SelectedShoe(shoe: shoe)
        let cartShoes = cartService.cart
        guard let index = cartShoes.firstIndex(of: selectedShoe) else { return }
        if shoeQuantity == 0 {
            cartShoes[index].isFavorited = false
            cartShoes[index].isInCart = false
            cartService.removeShoe(selectedShoe: selectedShoe)
            tableViewDelegate?.updateTableView()
        }
        cartShoes[index].quantity = shoeQuantity
        shoeQuantityLabel.text = String(shoeQuantity)
        tableViewDelegate?.updateTotalCost()
    }
    
    
}
