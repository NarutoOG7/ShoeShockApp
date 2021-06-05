//
//  CartVC.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
    
    @IBAction func purchasePressed(_ sender: UIButton) {
        // New VC or create an alert?
    }
    

}

extension CartVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellIdentifiers.cartCell, for: indexPath) as! CartCell
        let shoe = Cart.cart[indexPath.row].shoe
        cell.updateView(shoe: shoe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
