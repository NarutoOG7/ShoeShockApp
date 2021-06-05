//
//  Cart.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 6/4/21.
//

import Foundation


struct Cart {
    static var instance = Cart()
    static var cart = [SelectedShoe]()
    
    func addShoe(shoe: Shoe) {
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        Cart.cart.append(selectedShoe)
    }
    
    func removeShoe(shoe: Shoe) {
        var selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        guard let index = Cart.cart.firstIndex(of: selectedShoe) else { return }
        if Cart.cart[index].quantity > 1 {
            selectedShoe.quantity -= 1
        } else {
            Cart.cart.remove(at: index)
        }
    }
}
