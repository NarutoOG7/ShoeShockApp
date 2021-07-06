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
    
    var shoe: Shoe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let shoe = shoe else { return }
        shoeNameLabel.text = shoe.name
        shoeImage.image = UIImage(named: shoe.image)
        shoePriceLabel.text = "$\(shoe.price)"
        shoeDetailsTextView.text = shoe.details
        
    }
    

    @IBAction func addToBagPressed(_ sender: UIButton) {
        guard let shoe = shoe else { return }
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        CartService.instance.cart.append(selectedShoe)
        print(CartService.instance.cart)
    }
    

}
