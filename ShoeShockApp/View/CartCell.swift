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
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var shoeQuantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var shoe: Shoe?
    var dataService = DataService.instance
    var cartService = CartService.instance
    var selectedShoe: SelectedShoe?
    var cart = CartService.instance.cart
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
        shoeImage.image = UIImage(named: shoe.images[0])
        shoeNameLabel.text = "\(shoe.brand) \(shoe.name)"
        shoePriceLabel.text = String(format: "$%.2f", shoe.price)
        shoeQuantityLabel.text = "\(selectedShoe.quantity)"
        colorView.layer.cornerRadius = 20
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        guard let shoe = shoe else { return }
        let shoeQuantity = Int(stepper.value)
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        let cartShoes = cartService.cart
        guard let index = cartShoes.firstIndex(of: selectedShoe) else { return }
        if shoeQuantity == 0 {
            cartService.removeShoe(shoe: shoe)
            tableViewDelegate?.updateTableView()
        }
        cartShoes[index].quantity = shoeQuantity
        shoeQuantityLabel.text = String(shoeQuantity)
        tableViewDelegate?.updateTotalCost()
    }
    
    
}
