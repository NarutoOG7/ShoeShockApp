//
//  CartCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

protocol CartCellTableViewDelegate {
    func updateTableView()
}
protocol CartCellHeartDelegate {
    func updateHeart()
}

class CartCell: UITableViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var shoeQuantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var shoe: Shoe?
    var shoes = DataService.instance.shoes
    var selectedShoe: SelectedShoe?
    var index = IndexPath()
    var cart = Cart.instance.cart
    var tableViewDelegate: CartCellTableViewDelegate?
    var heartDelegate: CartCellHeartDelegate?
    
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
        guard let shoe = shoe else { return }
        guard let indexPath = shoes.firstIndex(of: shoe) else { return }
        var shoeQuantity = Cart.instance.cart[index.row].quantity
        shoeQuantity = Int(sender.value)
        shoeQuantityLabel.text = String(shoeQuantity)
        print(shoes)
        print(shoeQuantity)
        if shoeQuantity == 0 {
            print(shoes)
            Cart.instance.removeShoe(shoe: shoe)
            tableViewDelegate?.updateTableView()
            print(DataService.instance.shoes[indexPath].isFavorited)
            shoes[indexPath].isFavorited = false
            heartDelegate?.updateHeart()
            print(DataService.instance.shoes[indexPath].isFavorited)
        }
    }
    
    
}
