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
    
    @IBOutlet weak var checkoutButton: UIButton!
    var cartService = CartService.instance
    var dataService = DataService.instance
    var shoe: Shoe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cartTableView.dataSource = self
        cartTableView.delegate = self
        checkoutButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartTableView.reloadData()
        updateTotalPriceLabel()
        
    }
    
    
    func updateTotalPriceLabel() {
        let totalCost = cartService.configureTotalCost()
        totalPriceLabel.text = String(format: "$%.2f", totalCost)
        if totalCost == 0.0 {
            totalPriceLabel.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.toDetailsVC {
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.shoe = shoe
            detailsVC.previousVC = "Cart"
        }

    }
    @IBAction func checkoutPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segues.toPurchase, sender: sender)
    }
    
    @IBAction func unwindFromDetailsVC(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindFromPurchaseVC(_ sender: UIStoryboardSegue) {
        
    }
    
}

//MARK: - CartTableView DataSource and Delegate

extension CartVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartService.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellIdentifiers.cartCell, for: indexPath) as! CartCell
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedShoe = cartService.cart[indexPath.row]
        shoe = selectedShoe.shoe
        self.performSegue(withIdentifier: K.Segues.toDetailsVC, sender: indexPath)
    }
    
}

//MARK: - CartCellTableView Delegate

extension CartVC: CartCellTableViewDelegate {
    func updateTableView() {
        cartTableView.reloadData()
    }
    func updateTotalCost() {
        updateTotalPriceLabel()
    }
}
