//
//  Shoe.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import Foundation


struct  Shoe {
    private(set) public var image: String
    private(set) public var name: String
    private(set) public var price: Double
    private(set) public var quantity: Int
    private(set) public var details: String
    private(set) public var key: String
    
    var isFavorited: Bool
    var isInCart: Bool
    
    
    init(image: String, name: String, price: Double, quantity: Int, details: String, key: String, isFavorited: Bool, isInCart: Bool) {
        self.image = image
        self.name = name
        self.price = price
        self.quantity = quantity
        self.details = details
        self.key = key
        self.isFavorited = isFavorited
        self.isInCart = isInCart
    }
}
