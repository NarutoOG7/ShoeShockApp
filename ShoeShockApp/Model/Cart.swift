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
        if cart.contains(selectedShoe) {
            guard let index = cart.firstIndex(of: selectedShoe) else { return }
            cart[index].shoe.quantity += 1
        } else {
            cart.append(selectedShoe)
        }
    }
    
    mutating func removeShoe(shoe: Shoe) {
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        guard let index = cart.firstIndex(of: selectedShoe) else { return }
            cart.remove(at: index)
    }
    
    func getTotal() -> Double {
        var price = 0.0
        for shoe in cart {
            print("shoe price, should never change: \(shoe.shoe.price)")
            print(shoe.shoe.quantity)
            let shoePrice = shoe.shoe.price * Double(shoe.shoe.quantity)
            price += shoePrice
        }
        return price
    }
}
