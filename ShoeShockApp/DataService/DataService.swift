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
        Shoe(image: "BBShoe01", name: "NIKE Air Max 1", price: 110.00, quantity: 1, details: "Soft"),
        Shoe(image: "BBShoe02", name: "NIKE Jumpman", price: 100.00, quantity: 1, details: "Jump up your game"),
        Shoe(image: "BBShoe03", name: "NIKE Air Jordan Retro", price: 1500.00, quantity: 1, details: "Classic"),
        Shoe(image: "BBShoe04", name: "NIKE Ballers", price: 90.00, quantity: 1, details: "Wanna be a baller?"),
        Shoe(image: "BBShoe05", name: "NIKE Runners", price: 150.00, quantity: 1, details: "Be light, be quick."),
        Shoe(image: "BBShoe06", name: "NIKE Cloud", price: 120.00, quantity: 1, details: "Float around, like Mike"),
        Shoe(image: "BBShoe07", name: "NIKE MoonShoes", price: 1000.00, quantity: 1, details: "Bounce Bounce")
    ]
    
    func getShoes() -> [Shoe] {
        return shoes
    }
}
