//
//  Cart.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 6/4/21.
//

import Foundation


struct Cart {
    static var instance = Cart()
    var cart = [SelectedShoe]()
    
    func getCartShoes() -> [SelectedShoe] {
        return cart
    }
    
    mutating func addShoe(shoe: Shoe) {
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        cart.append(selectedShoe)
    }
    
    mutating func removeShoe(shoe: Shoe) {
        var selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        guard let index = cart.firstIndex(of: selectedShoe) else { return }
        if cart[index].quantity > 1 {
            selectedShoe.quantity -= 1
        } else {
            cart.remove(at: index)
        }
    }
}
