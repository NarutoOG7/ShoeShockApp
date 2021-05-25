//
//  DataService.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import Foundation

struct DataService {
    
    static var instance = DataService()
    
    let shoes: [Shoe] = [
        Shoe(image: "BBShoe01", name: "NIKE Air Max 1", price: 110.00, quantity: 1, details: "Soft", key: "1", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe02", name: "NIKE Jumpman", price: 100.00, quantity: 1, details: "Jump up your game", key: "2", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe03", name: "NIKE Air Jordan Retro", price: 1500.00, quantity: 1, details: "Classic", key: "3", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe04", name: "NIKE Ballers", price: 90.00, quantity: 1, details: "Wanna be a baller?", key: "4", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe05", name: "NIKE Runners", price: 150.00, quantity: 1, details: "Be light, be quick.", key: "5", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe06", name: "NIKE Cloud", price: 120.00, quantity: 1, details: "Float around, like Mike", key: "6", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe07", name: "NIKE MoonShoes", price: 1000.00, quantity: 1, details: "Bounce Bounce", key: "7", isFavorited: false, isInCart: false)
    ]
    
    var cart: [Shoe] = []
    
    func getShoes() -> [Shoe] {
        return shoes
    }
    
    mutating func addShoe(shoe: Shoe) {
        var selectedShoe = shoe
        selectedShoe.isFavorited = true
        selectedShoe.isInCart = true
        cart.append(shoe)
    }
    
    mutating func removeShoe(shoe: Shoe) {
        if let index = cart.firstIndex(of: shoe) {
            cart.remove(at: index)
        }
//        if shoe.key ==  {
//
//        }
//        let shoeIndex = sho
//        cart.remove(at: )
    }
    
    
}
