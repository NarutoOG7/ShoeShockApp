//
//  CartVC.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var cartService = CartService.instance
    var dataService = DataService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartTableView.reloadData()
        updateTotalPriceLabel()
    }
    
    @IBAction func purchasePressed(_ sender: UIButton) {
        // New VC or create an alert?
    }
    
    func updateTotalPriceLabel() {
        let totalCost = cartService.configureTotalCost()
        totalPriceLabel.text = String(totalCost)
        if totalCost == 0.0 {
            totalPriceLabel.text = ""
        }
    }

}

extension CartVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartService.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.cartCell, for: indexPath) as! CartCell
        let selectedShoe = cartService.cart[indexPath.row]
        let shoe = selectedShoe.shoe
        cell.tableViewDelegate = self
        cell.selectedShoe = selectedShoe
        cell.shoe = shoe
        cell.shoeQuantityLabel.text = String(selectedShoe.quantity)
        cell.updateView(shoe: shoe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
 
}


extension CartVC: CartCellTableViewDelegate {
    func updateTableView() {
        cartTableView.reloadData()
    }
    func updateTotalCost() {
        updateTotalPriceLabel()
    }
}
