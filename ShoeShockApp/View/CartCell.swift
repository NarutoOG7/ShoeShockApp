//
//  CartCell.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var shoeQuantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var shoe: Shoe?
    
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
    
    func onStepperPressed() {
        self.shoe?.quantity = Int(stepper.value)
        self.shoe.
    }
    
}
