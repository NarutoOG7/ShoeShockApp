//
//  Cart.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 6/4/21.
//

import Foundation


class CartService {
    static var instance = CartService()
    var cart = [SelectedShoe]()
    
    func getCartShoes() -> [SelectedShoe] {
        return cart
    }
    
    func addShoe(shoe: Shoe) {
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        cart.append(selectedShoe)
        
    }
    
    func removeShoe(shoe: Shoe) {
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        guard let index = cart.firstIndex(of: selectedShoe) else { return }
        cart.remove(at: index)
        
    }
    
    func configureTotalCost() -> Double {
        var totalCost: Double  = 0
        for shoe in cart {
            let cost = Double(shoe.quantity) * shoe.shoe.price
            totalCost += cost
        }
        return totalCost
    }
    
    
}
