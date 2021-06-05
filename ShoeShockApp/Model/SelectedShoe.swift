//
//  SelectedProduct.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/31/21.
//

import Foundation


struct SelectedShoe: Equatable {
    var shoe: Shoe
    var quantity = 0
    var totalCost = 0.0
    
    mutating func calculateTotal() {
        totalCost = shoe.price * Double(quantity)
    }
}
