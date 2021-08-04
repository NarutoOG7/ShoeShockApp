//
//  PurchaseVC.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 7/18/21.
//

import UIKit

class PurchaseVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cartTableView: UITableView!

    @IBOutlet weak var shippingPriceLabel: UILabel!
    @IBOutlet weak var taxPriceLabel: UILabel!
    @IBOutlet weak var subTotalLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
<<<<<<< HEAD
    var shoe: Shoe?
=======
>>>>>>> noSectionHeader
    var cartService = CartService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.dataSource = self
        cartTableView.delegate = self
        mainView.layer.cornerRadius = 15
        
        confirmButton.layer.cornerRadius = 20
<<<<<<< HEAD
=======
        mainView.layer.cornerRadius = 15
>>>>>>> noSectionHeader
        updatePriceLabels()
    }
    
    func updatePriceLabels() {
        let baseTotal = cartService.configureTotalCost()
        let shoeCount = cartService.getCartShoes().count
        let shipPrice = Double(shoeCount * 3)
        let taxPrice = Double(baseTotal / 7)
        let totalPrice = baseTotal + shipPrice + taxPrice
        subTotalLabel.text = String(format: "$ %.2f", baseTotal)
        shippingPriceLabel.text = String(format: "$ %.2f", shipPrice)
        taxPriceLabel.text = String(format: "$ %.2f", taxPrice)
        totalPriceLabel.text = String(format: "$ %.2f", totalPrice)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.purchaseToHome {
            cartService.cart.removeAll()
        }
    }
}

extension PurchaseVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartService.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellIdentifiers.purchaseCell) as! CartCell
        let selectedShoe = cartService.cart[indexPath.row]
        cell.shoe = selectedShoe.shoe
        cell.selectedShoe = selectedShoe
        cell.updateView(shoe: selectedShoe.shoe)
        cell.shoeQuantityLabel.text = String(selectedShoe.quantity)
        return cell
    }
    
    
}

